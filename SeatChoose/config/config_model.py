import sys
import os
import re
from sqlalchemy import or_

path = os.getcwd()
print(path)
pattern = re.compile(r'(.+?)/config')
res = pattern.findall(path)
if len(res) == 0:
    sys.path.append(path)
    print(r'得到上级目录')
else:
    sys.path.append(res[0])
    print(r'得到config目录')


from datetime import datetime
from model.models import *
from scy import db
# 所需功能
# 将过期选择座位作废
# 将到时间的定制座位变成选座状态

from apscheduler.schedulers.blocking import BlockingScheduler

sched = BlockingScheduler()
@sched.scheduled_job('interval', seconds=5)
def status3_to_status1_or_status2():

    records_status_3 = ChoosedSet.query.filter(ChoosedSet.endTime < datetime.now()).all()

    if len(records_status_3) == 0:
        return
    else:
        for record in records_status_3:
            seat = Seat.query.filter(Seat.seatID == record.seatID).first()
            db.session.delete(record)
            nextrecord = ChoosedSet.query.filter(seat.seatID==ChoosedSet.seatID).all()
            seatinfo = '{0}{1}{2}{3}号座位'.format(datetime.now().strftime('%Y-%m-%d %H:%M'), seat.position.floor, seat.position.zone, seat.curPosCode)
            if len(nextrecord) == 0:
                seat.statusCode = 1
                print(seatinfo+'到期')
            else:
                seat.statusCode = 2
                print(seatinfo+'座位到期转为下一个人的预约状态' + '-' * 100)
        db.session.commit()

@sched.scheduled_job('interval', seconds=6)
def status2_to_status3():

    seats_status_2 = Seat.query.filter(Seat.statusCode == 2).all()
    if len(seats_status_2) == 0:
        return
    else:
        for seat in seats_status_2:
            record = ChoosedSet.query.filter(seat.seatID == ChoosedSet.seatID, ChoosedSet.beginTime < datetime.now()).first()
            seatinfo = '{0}{1}{2}{3}号座位'.format(datetime.now().strftime('%Y-%m-%d %H:%M'), seat.position.floor,
                                                seat.position.zone, seat.curPosCode)
            if record:
                seat.statusCode = 3
                print(seatinfo+'预定状态转为选座了')
        db.session.commit()

@sched.scheduled_job('interval', seconds = 60)
def check_seat_info():

    seats = db.session.query(Seat).filter(Seat.statusCode != 1).all()
    if seats:
        for seat in seats:
            record = ChoosedSet.query.filter(ChoosedSet.seatID == seat.seatID).first()
            if record is None:
                seat.statusCode = 1
                db.session.commit()



if __name__ == '__main__':
    sched.start()
