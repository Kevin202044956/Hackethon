import datetime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()
Base = declarative_base()

class LoginUser(Base,db.Model):
    __tablename__ = 'LoginUser'

    ID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    Name = db.Column(db.String(64), nullable=False, unique=True)
    Role = db.Column(db.Integer, nullable=False,comment="1 => doctor, 2 => patient")
    Password = db.Column(db.String(128), nullable=False)
    Commit = db.Column(db.TEXT, nullable=True)
    Roleid = db.Column(db.Integer, nullable=False)

    def __init__(self):
        self.id = PatientDetail.query.order_by(PatientDetail.id.desc()).first()

    def __repr__(self):
        return '<LoginUser %s>' % self.__tablename__

class PatientDetail(Base,db.Model):
    __tablename__ = 'PatientDetail'

    ID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    Name = db.Column(db.String(64), nullable=False)
    Age = db.Column(db.Integer, nullable=False)
    Phone = db.Column(db.String(10), nullable=False)
    Address = db.Column(db.String(100), nullable=True,default="Unknown")
    SSN = db.Column(db.String(9), nullable=False)
    Commit = db.Column(db.TEXT, nullable=True)

    def __init__(self):
        self.id = PatientDetail.query.order_by(PatientDetail.id.desc()).first()

    def __repr__(self):
        return '<PatientDetail %s>' % self.__tablename__

class DoctorDetail(Base,db.Model):
    __tablename__ = 'DoctorDetail'

    ID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    Name = db.Column(db.String(64), nullable=False)
    Age = db.Column(db.Integer, nullable=False)
    Department = db.Column(db.String(64), nullable=False)
    Phone = db.Column(db.String(10), nullable=False)
    Address = db.Column(db.String(100), nullable=True,default="Unknown")
    SSN = db.Column(db.String(9), nullable=False)
    Commit = db.Column(db.String(100), nullable=True)

    def __init__(self):
        pass

    def __repr__(self):
        return '<PatientDetail %s>' % self.__tablename__

class BeInHospital(Base,db.Model):
    __tablename__ = 'BeInHospital'

    PatientID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    Ctime = db.Column(db.TIMESTAMP, nullable=False,comment="create time")
    Department = db.Column(db.String(64), nullable=False)
    Disease = db.Column(db.String(64), nullable=False)
    OperateDate = db.Column(db.TIMESTAMP, nullable=False)

    def __init__(self):
        self.Ctime = datetime.utcnow()
        self.OperateDate = datetime.utcnow()

    def __repr__(self):
        return '<BeInHospital %s>' % self.__tablename__


class PostRecord(Base,db.Model):
    __tablename__ = 'PostRecord'

    RecordID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    DoctorID = db.Column(db.Integer, nullable=False)
    PatientID = db.Column(db.Integer, nullable=False)
    CheckStartDate = db.Column(db.DATE, nullable=False)
    PostDays = db.Column(db.Integer, nullable=False)
    Medicines = db.Column(db.TEXT(200), nullable=True)
    Doses = db.Column(db.FLOAT, nullable=False)
    Times = db.Column(db.Integer, nullable=False)
    Symptom = db.Column(db.String(120), nullable=False,default="Unknown")
    ExamResult = db.Column(db.String(120), nullable=True)

    def __init__(self):
        self.CheckStartDate = datetime.utcnow()

    def __repr__(self):
        return '<PostRecord %s>' % self.__tablename__

engine = create_engine("mysql+pymysql://root:TSjinrong@172.16.48.69/post_op",encoding="utf-8",echo=True,max_overflow=5)
Base.metadata.create_all(engine)