from datetime import datetime
from scy import db



#学生信息表
class Student(db.Model):

    __tablename__ = 'student'
    studentID = db.Column(db.String(12), primary_key=True)
    name = db.Column(db.String)
    ID_card = db.Column(db.String(18), unique=True)
    majorCode = db.Column(db.Integer, db.ForeignKey('major.code'))
    grade = db.Column(db.Integer)
    gender = db.Column(db.String(1))

    def __init__(self, studentID, name, ID_card, majorCode, grade, gender):
        self.studentID = studentID
        self.name = name
        self.ID_card = ID_card
        self.majorCode = majorCode
        self.grade = grade
        self.gender = gender

    def __repr__(self):
        return f'<{self.studentID}:<{self.name}>>'

#专业信息表
class Major(db.Model):

    __tablename__ = 'major'
    code = db.Column(db.Integer, primary_key=True)
    majorValue = db.Column(db.String(20))

    def __init__(self, code, majorValue):
        self.code = code
        self.majorValue = majorValue

    def __repr__(self):
        return f'<{self.code}:<{self.majorValue}>>'



#座位状态信息
# 1未使用
# 2已预约
# 3已使用
# 4暂离
class SeatStatus(db.Model):
    __tablename__ = 'seatStatus'
    code = db.Column(db.Integer, primary_key=True)
    statusValue = db.Column(db.String)

    def __init__(self, code, statusValue):
        self.code = code
        self.statusValue = statusValue

    def __repr__(self):
        return f'{self.statusValue}'


# 区域位置信息
class Position(db.Model):

    __tablename__ = 'position'
    id = db.Column(db.Integer, primary_key=True)
    floor = db.Column(db.String)
    zone = db.Column(db.String)

    def __init__(self, id, floor, zone):
        self.id = id
        self.floor = floor
        self.zone = zone

    def __repr__(self):
        return f'{self.floor}{self.zone}'


# 座位信息
class Seat(db.Model):
    __tablename__ = 'seat'

    seatID = db.Column(db.Integer, primary_key=True)
    # current_position_Code
    curPosCode = db.Column(db.Integer)
    position_id = db.Column(db.Integer, db.ForeignKey('position.id'))
    statusCode = db.Column(db.Integer, db.ForeignKey('seatStatus.code'))
    deskID = db.Column(db.Integer)

    seatStatus = db.relationship('SeatStatus', backref=db.backref('Seat.statusCode', lazy='dynamic'))
    position = db.relationship('Position', backref=db.backref('Seat.position_id', lazy='dynamic'))


    def __init__(self, seatID, curPosCode, position_id, statusCode, deskID):
        self.seatID = seatID
        self.curPosCode = curPosCode
        self.position_id = position_id
        self.statusCode = statusCode
        self.deskID = deskID


    def __repr__(self):
        return f"{self.position.floor}{self.position.zone}'s {self.curPosCode} status:{self.seatStatus.statusValue}"

    def to_json(self):
        return dict(curPosCode=self.curPosCode, pos=self.position_id, status=self.statusCode)


class ChoosedSet(db.Model):
    __tablename__ = 'choosedSet'

    seatID = db.Column(db.Integer, db.ForeignKey('seat.seatID'), primary_key=True)
    userID = db.Column(db.String(12), db.ForeignKey('student.studentID'), primary_key=True)
    beginTime = db.Column(db.DateTime)
    endTime = db.Column(db.DateTime)


    def __init__(self, seatID, userID, beginTime=None, endTime=None):
        self.seatID = seatID
        self.userID = userID
        self.beginTime = beginTime if beginTime else datetime.now()
        self.endTime = endTime if endTime else endTime + datetime.timedelta(hours=3)


    def __repr__(self):
        return f"<{self.seatID}>in[{self.beginTime}]"