from flask import render_template,session
from utility.utils import DbOps
class SystemCore(object):

    @property
    def get_gtitle(self):
        return  "Post Operation Record System"

    @staticmethod
    def getMain():
        return render_template('home.html', Title=SystemCore().get_gtitle ,role=session['role'])

    @staticmethod
    def Getinfo(tbl):
      values = DbOps(tbl).searchALL()
      print(values)
      return values

