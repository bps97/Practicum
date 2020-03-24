from flask import render_template, request, redirect, url_for, session
from flask import jsonify, abort
from flask.views import MethodView
from model.models import *
from choose import cho
from datetime import datetime, timedelta


class SeatView(MethodView):
    def get(self, position=1):
        userID = session.get('admin', None)
        if userID is None:
            session['pos'] = request.path
            return redirect(url_for('login'))
        # if not request.is_xhr:
        #     abort(404)
        seats = db.session().query(Seat).filter(Seat.position_id == position)
        positions = Position.query.all()
        i = 1
        res = []
        row = []
        desk = []
        for s in seats:
            data = {
                'code': s.curPosCode,
                'status': s.statusCode,
                'type': len(str(s.curPosCode))
            }
            if (s.deskID == i):
                desk.append(data)
            else:
                row.append(desk)
                if ((i + 1) % 6 == 1):
                    res.append(row)
                    row = []
                desk = []
                desk.append(data)
            i = s.deskID
        row.append(desk)
        res.append(row)
        record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()
        choosed = True if (record) else False
        curPosId = Seat.query.filter(Seat.seatID == record.seatID).first().curPosCode if record else ''

        return render_template('index.html', position=position, positions=positions, seats=res, choosed=choosed, curPosId=curPosId)

    def post(self, position=1):

        #resp (response)
        userID = session.get('admin')  # 用户名
        record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()  #记录
        curPosid = int(request.form.get('opt-seatID'))

        if record:  #退座或者退订
            seat = Seat.query.filter(Seat.seatID == record.seatID, ChoosedSet.userID == userID).first()
            resp = seat.to_json().copy()
            if curPosid == 0 and seat:  # 退座

                db.session.delete(record)
                next = ChoosedSet.query.filter(ChoosedSet.seatID == seat.seatID).order_by(ChoosedSet.beginTime).first()

                if next:
                    # nextSeat = Seat.query.filter(next.seatID == Seat.seatID).first()
                    if next.beginTime > datetime.now():
                        resp['status'] = 302
                        seat.statusCode = 2
                    else:

                        resp['status'] = 303
                        seat.statusCode = 3
                else:
                    resp['status'] = 301
                    seat.statusCode = 1

                db.session.commit()

            return jsonify(resp)
        else:
            if curPosid == 0: #没选位置就提交
                return jsonify(dict(curPosid=0, pos=None, status=501))
            else:

                seat = Seat.query.filter(Seat.curPosCode == curPosid, Seat.position_id == position).first()
                resp = seat.to_json().copy()

                if request.form.get('time') == 'now':   #选座
                    now = datetime.now()
                    if now.hour < 6 or now.hour > 22:
                        resp['status'] = 506
                        return jsonify(resp)
                    else:
                        # 座位可选
                        if seat.statusCode == 1:
                            exitTime = now + timedelta(hours=3)
                            if exitTime.hour >= 22 or exitTime.day > now.day or exitTime.month.day > now.day or exitTime.year > now.year:
                                exitTime = datetime(exitTime.year, exitTime.month, exitTime.day, 22, 0, 0)
                            newRecord = ChoosedSet(seat.seatID, userID, now, exitTime)
                            db.session.add(newRecord)
                            seat.statusCode = 3
                            db.session.commit()
                            resp['status'] = 101
                            return jsonify(resp)

                        # 被人预定了
                        elif seat.statusCode == 2:
                            next = db.session().query(ChoosedSet).filter(seat.seatID == ChoosedSet.seatID).order_by(ChoosedSet.beginTime).first()
                            D_value = next.beginTime-now  #下个预订者的开始时间和现在的差值

                            #下一个预订者在三小时后
                            if D_value > timedelta(hours=3):
                                newRecord = ChoosedSet(seat.seatID, userID, now, now + timedelta(hours=3))
                                db.session.add(newRecord)
                                seat.statusCode = 3
                                db.session.commit()
                                resp['status'] = 102

                            #下一个预定者在一小时后但又不超过三小时
                            elif D_value >= timedelta(hours=1) and D_value > timedelta(hours=0):
                                newRecord = ChoosedSet(seat.seatID, userID, now, next.beginTime)
                                db.session.add(newRecord)
                                seat.statusCode = 3
                                db.session.commit()
                                resp['status'] = 102

                            #下个预订者在一小时内
                            elif D_value < timedelta(hours=1) and D_value > timedelta(hours=0):
                                newRecord = ChoosedSet(seat.seatID, userID, now, next.beginTime)
                                db.session.add(newRecord)
                                seat.statusCode = 3
                                db.session.commit()
                                resp['status'] = 103
                            #预订者的变为正式使用者了
                            else:
                                resp['status'] = 112
                                resp['timepoint'] = next.beginTime
                            return jsonify(resp)

                        # 已经被人选了
                        elif seat.statusCode == 3:
                            resp['status'] = 113
                            return jsonify(resp)

                        # 暂离
                        else:
                            resp['status'] = 114
                            return jsonify(resp)
                else:
                    # 预约
                    original_time = request.form.get('time', '')
                    if original_time is '':
                            resp['status'] = 502
                            return jsonify(resp)
                    else:

                        start = datetime.strptime('20'+original_time, '%Y-%m-%d %H:%M')
                        now = datetime.now()

                        # 当选择的时间为过去的时间
                        if start < now:
                            resp['status'] = 503
                            return jsonify(resp)

                        # 预定时间超出一天
                        elif (start-now).days > 0:
                            resp['status'] = 504
                            return jsonify(resp)

                        #当预约时间超过19：00
                        elif start.hour > 19 or start.hour < 6:
                            resp['status'] = 505
                            return jsonify(resp)

                        else:

                            # 座位可选
                            if seat.statusCode == 1:

                                newRecord = ChoosedSet(seat.seatID, userID, start, start + timedelta(hours=3))
                                db.session.add(newRecord)
                                seat.statusCode = 2
                                db.session.commit()
                                resp['status'] = 201
                                resp['timepoint'] = start
                                return jsonify(resp)

                            # 被人预定了
                            elif seat.statusCode == 2:
                                next= db.session().query(ChoosedSet).filter(seat.seatID == ChoosedSet.seatID).order_by(ChoosedSet.beginTime).first()

                                D_value = start - next.endTime
                                if D_value > timedelta(hours=0) and D_value < timedelta(hours=0.5):  #在别人预定的结束时间之后预定但又不能超过0.5小时
                                    newRecord = ChoosedSet(seat.seatID, userID, start, start + timedelta(hours=3))
                                    db.session.add(newRecord)
                                    db.session.commit()
                                    resp['status'] = 202
                                    resp['timepoint'] = start
                                else:
                                    resp['status'] = 212
                                    resp['timepoint'] = next.endTime
                                return jsonify(resp)

                            # 已经被人使用
                            elif seat.statusCode ==3:
                                resp['status'] = 213
                                return jsonify(resp)

                            # 暂离
                            else:
                                resp['status'] = 214
                                return jsonify(resp)


class SeatMatrixView(MethodView):
    def get(self):
        positions = Position.query.all()
        return render_template('seatMatrix.html', positions=positions)


class SeatScheView(MethodView):
    def post(self, position):

        curPosCode = int(request.form.get('curPosCode'))
        userID = session.get('admin')  # 用户名
        record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()
        if record:
            seatCurPosCode = Seat.query.filter(record.seatID == Seat.seatID).first().curPosCode
            curPosCode = seatCurPosCode

        if curPosCode == 0:
            return "您好 您未选择座位无法查看"
        if request.is_xhr:
            seat = Seat.query.filter(Seat.position_id == position, Seat.curPosCode == curPosCode).first()
            if seat:
                records = ChoosedSet.query.filter(seat.seatID == ChoosedSet.seatID).order_by(ChoosedSet.beginTime)
                res = []
                legend = []
                res.append(dict(value=21600, name="00:00-05:59\n不可选"))
                today = datetime.now()
                cur = datetime(today.year, today.month, today.day, 6, 0, 0)
                ending = datetime(today.year, today.month, today.day, 22, 0, 0)

                for record in records:
                    if record.beginTime > cur:
                        str = '{}-{}'.format(datetime.strftime(cur, '%H:%M'), datetime.strftime(record.beginTime, '%H:%M'))
                        res.append(dict(value=(record.beginTime - cur).seconds, name=str+'\n空闲时段'))
                        legend.append('空闲')
                        cur = record.endTime
                    temp = record.endTime-record.beginTime
                    str = '{}-{}'.format(datetime.strftime(record.beginTime, '%H:%M'), datetime.strftime(record.endTime, '%H:%M'))
                    res.append(dict(value=temp.seconds, name=str+"\n被使用或预约"))
                if cur < ending:
                    str = '{}-'.format(datetime.strftime(cur, '%H:%M'))
                    res.append(dict(value=(ending-cur).seconds, name=str+'21:59\n空闲时段'))
                res.append(dict(value=7200, name="22:00-23:59\n不可选"))

            # return str(res)
            return render_template('schedule.html', result=res)
        else:
            abort(404)


class SeatInfoView(MethodView):
    def get(self):
        if request.is_xhr:
            userID = session['admin']
            record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()

            if record:
                seat = Seat.query.filter(Seat.seatID == record.seatID).first()
                floor = seat.position.floor
                zone = seat.position.zone
                begin = datetime.strftime(record.beginTime, '%Y-%m-%d %H:%M')
                end = datetime.strftime(record.endTime, '%Y-%m-%d %H:%M')
                return jsonify(dict(floor=floor, zone=zone, curPosCode=seat.curPosCode, status=seat.seatStatus.statusValue, begin=begin, end=end))
            else:
                return ''
        else:
            abort(404)


class TimeExtendView(MethodView):
    def get(self):
        # if request.is_xhr:
            userID = session['admin']
            record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()
            CODE = {}
            if record:
                seat = Seat.query.filter(Seat.seatID == record.seatID).first()
                seqRecord = ChoosedSet.query.filter(seat.seatID == ChoosedSet.seatID).order_by(ChoosedSet.beginTime)
                theFirst = seqRecord.first()
                theSecond = seqRecord.filter(ChoosedSet.userID != userID).first()
                if theFirst.userID == record.userID:
                    seatStatusCode = seat.statusCode
                    endTime = record.endTime
                    if seatStatusCode == 3:
                        if endTime - datetime.now() > timedelta(hours=1.5):
                            CODE['status'] = 603
                            CODE['time'] = datetime.strftime(endTime-timedelta(hours=1.5), '%H:%M')

                            return jsonify(CODE)
                        if theSecond:
                            return '>>'
                            D_value = theSecond.beginTime - record.endTime

                            if D_value >= timedelta(hours=3):
                                record.endTime += timedelta(hours=3)
                                db.session.commit()
                                CODE['status'] = 101
                                CODE['time'] = datetime.strftime(endTime, '%H:%M')
                                return jsonify(CODE)
                            elif D_value < timedelta(hours=3) and D_value > timedelta(hours=1) :
                                record.endTime = theSecond.beginTime - timedelta(seconds=10)
                                db.session.commit()
                                CODE['status'] = 103
                                CODE['time'] = datetime.strftime(endTime, '%H:%M')
                                return jsonify(CODE)
                            elif D_value <= timedelta(hours=1) and D_value > timedelta(minutes=1) :
                                record.endTime = theSecond.beginTime - timedelta(seconds=10)
                                db.session.commit()
                                CODE['status'] = 104
                                CODE['time'] = datetime.strftime(endTime, '%H:%M')
                                return jsonify(CODE)
                            elif D_value <= timedelta(minutes=1):
                                CODE['status'] = 604
                                return jsonify(CODE)
                        else:
                            record.endTime += timedelta(hours=3)
                            db.session.commit()
                            CODE['status'] = 101
                            CODE['time'] = datetime.strftime(endTime, '%H:%M')
                            CODE['mm'] = '???'
                            return jsonify(CODE)
                    else:
                        CODE['status'] = 602
                        return jsonify(CODE)
                else:
                    CODE['status'] = 602
                    return jsonify(CODE)

            else:
                CODE['status'] = 601
                return jsonify(CODE)
        # else:
            # abort(404)


class SeatLeaveView(MethodView):
    def get(self):
        if request.is_xhr:
            userID = session['admin']
            record = ChoosedSet.query.filter(ChoosedSet.userID == userID).first()
            if record:  #当你的结束时间少于1h就延长一小时
                seat = Seat.query.filter(Seat.seatID == record.seatID).first()
                if seat.statusCode == 3:
                    if record.beginTime < datetime.now():
                        floor = seat.position.floor
                        zone = seat.position.zone
                        begin = datetime.strftime(record.beginTime, '%Y-%m-%d %H:%M')
                        end = datetime.strftime(record.endTime, '%Y-%m-%d %H:%M')
                        next = ChoosedSet.query.filter(record.seatID == ChoosedSet.seatID,
                                                       record.userID != ChoosedSet.userID).order_by(ChoosedSet.beginTime).first()
                        if next:
                            if next.beginTime - datetime.now() > timedelta(hours=1):
                                #可暂离
                                if record.endTime - datetime.now() < timedelta(hours=1):
                                    record.endTime += timedelta(hours=1)
                                seat.statusCode = 4
                                db.session.commit()
                            else:
                                return jsonify(dict(status=-1))
                        else:
                            if record.endTime - datetime.now() < timedelta(hours=1):
                                record.endTime += timedelta(hours=1)
                            seat.statusCode = 4
                            db.session.commit()
                        return jsonify(dict(floor=floor, zone=zone, curPosCode=seat.curPosCode, status=seat.statusCode, begin=begin, end=end))
                    else:
                        return jsonify(dict(status=-2))
                else:
                    return jsonify(dict(status=-3))

            else:
                return ''
        else:
            abort(404)




class FlashView(MethodView):
    def get(self, position):
        seats = Seat.query.filter(Seat.position_id == position, Seat.statusCode != 1).all()
        resp = []
        for seat in seats:
            resp.append(dict(curPosCode=seat.curPosCode, status=seat.statusCode))
        return jsonify(resp)
        # return render_template('flashInfo.html', resp=resp)

cho.add_url_rule('/<int:position>/', view_func=SeatView.as_view('SeatView'))
cho.add_url_rule('/seat/', view_func=SeatMatrixView.as_view('SeatMatrixView'))
cho.add_url_rule('/info/', view_func=SeatInfoView.as_view('SeatInfoView'))
cho.add_url_rule('/leave/', view_func=SeatLeaveView.as_view('SeatLeaveView'))
cho.add_url_rule('/extend/', view_func=TimeExtendView.as_view('TimeExtendView'))
cho.add_url_rule('/<int:position>/sche/', view_func=SeatScheView.as_view('SeatScheView'))
cho.add_url_rule('/<int:position>/flash/', view_func=FlashView.as_view('FlashView'))