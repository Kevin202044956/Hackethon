from flask import Flask, request, render_template,session
from utility.db_models import db,LoginUser
from utility.syscore import SystemCore
from sqlalchemy.orm import sessionmaker
from sqlalchemy import  create_engine
import config


from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_pyfile('config.py')
app.secret_key = config.APP_SECRET_KEY
engine = create_engine(config.SQLALCHEMY_DATABASE_URI)
class Server(object):

    db = SQLAlchemy(app)
    hasLogin = False

    @staticmethod
    @app.route('/', methods=['GET', 'POST'])
    def home():
      if session.get('logined', None) is True:
        return SystemCore.getMain()
      else:
        return render_template('index.html',Title=SystemCore().get_gtitle)

    @staticmethod
    @app.route('/signin', methods=['POST'])
    def signin():
        if session.get('logined', None) is not True:
          print('in', 'not logined')
          session['logined'] = False
          SQLSession = sessionmaker(bind=engine)()
          try:
            print(request.form)

            if SQLSession.query(LoginUser.Password).filter(LoginUser.Name==request.form['username']).first()[0] == request.form['password']:
              session['username'] = request.form['username']
              session['role'] = SQLSession.query(LoginUser.Role).filter(LoginUser.Name==request.form['username']).first()[0]
              print(session['role'])
              session['logined'] = True
              print('in', session['logined'])
              return render_template('home.html', Title=SystemCore().get_gtitle,role=session['role'],username=session['username'])
            else:
              return render_template('index.html', Title=SystemCore().get_gtitle)
          except Exception as e:
            print("xxxx",e)
            return render_template('index.html', Title=SystemCore().get_gtitle)
        else:
          print(session)
          return render_template('home.html', Title=SystemCore().get_gtitle,
                                   role=session['role'],username=session['username'])

    @staticmethod
    @app.route('/logout', methods=['GET'])
    def logout():
      session.pop('logined')
      return render_template('index.html', Title=SystemCore().get_gtitle)


    @staticmethod
    @app.route('/Pinfo', methods=['GET'])
    def Pinfo():
      return render_template('Pinfo.html', values=SystemCore().Getinfo('PatientDetail'), Title=SystemCore().get_gtitle, role=session['role'])

    @staticmethod
    @app.route('/POinfo', methods=['GET'])
    def Poinfo():
      return render_template('Poinfo.html',values=SystemCore().Getinfo('PostRecord'), Title=SystemCore().get_gtitle)

    @staticmethod
    @app.route('/BHinfo', methods=['GET'])
    def BHinfo():
      return render_template('BHinfo.html', values=SystemCore().Getinfo('BeInHospital'), Title=SystemCore().get_gtitle)

if __name__ == '__main__':
    db.init_app(app)
    db.create_all()
    app.run(host="0.0.0.0",port=5000)
# SQLSession = sessionmaker(bind=engine)()
# print(SQLSession.query(LoginUser.Password).filter(LoginUser.Name=='admin').first()[0])