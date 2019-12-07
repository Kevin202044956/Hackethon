from flask import session
from sqlalchemy.orm import sessionmaker
from sqlalchemy import  create_engine
import config
from utility.db_models import *
class DbOps(object):
  def __init__(self,table):
    self.SQLSession = sessionmaker(bind=engine)()
    self.table=table

  def searchALL(self):
    from sqlalchemy.engine import reflection
    insp = reflection.Inspector.from_engine(engine)
    colums = insp.get_columns(self.table)
    head = []
    for col in colums:
      head.append(col.get('name'))
    if session['role'] == 1:
      if self.table == "PatientDetail":
        v = self.SQLSession.query(
          PatientDetail.ID,PatientDetail.Name,PatientDetail.Age,PatientDetail.Phone,PatientDetail.Address,PatientDetail.SSN,PatientDetail.Commit)\
          .order_by(PatientDetail.ID).all()
      if self.table == "BeInHospital":
        v = self.SQLSession.query(
          BeInHospital.PatientID,BeInHospital.Ctime,BeInHospital.Department,BeInHospital.Disease,BeInHospital.OperateDate)\
          .order_by(BeInHospital.PatientID).all()
      if self.table == "PostRecord":
        v = self.SQLSession.query(
          PostRecord.RecordID,PostRecord.DoctorID,PostRecord.PatientID,
          PostRecord.CheckStartDate,PostRecord.PostDays,PostRecord.Medicines,PostRecord.Doses,PostRecord.Times,PostRecord.Symptom,PostRecord.ExamResult)\
          .order_by(PostRecord.RecordID).all()
    else:
      roleid = self.SQLSession.query(LoginUser.Roleid)\
          .filter(LoginUser.Name==session['username']).first()[0]
      print(roleid)
      v = self.SQLSession.query(
          PatientDetail.ID,PatientDetail.Name,PatientDetail.Age,PatientDetail.Phone,PatientDetail.Address,PatientDetail.SSN,PatientDetail.Commit)\
          .filter(PatientDetail.ID==str(roleid)).first()
    print(v)
    return head,v

if __name__ == '__main__':
    DbOps('PostRecord').searchALL()