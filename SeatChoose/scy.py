from flask import Flask, render_template, session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__, static_url_path='')
app.secret_key='#wyygx5252&%33mlwcl32532ybq&2409^*(^u09h23cn*&s82352393*%hfan'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///./db/mm.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_ECHO'] = False



db = SQLAlchemy(app)    #初始化SQLAlchemy对象 用以作数据库
db.init_app(app)

#登陆模块
from view.views import LoginView, LogoutView
app.add_url_rule('/login/', view_func=LoginView.as_view('login'), endpoint='login')
app.add_url_rule('/logout/', view_func=LogoutView.as_view('logout'), endpoint='logout')


#选座模块
from choose.views import cho
#注册蓝图
app.register_blueprint(cho, url_prefix='/choose')

@app.route('/')
def hello_world():
    userID = session.get('admin', None)
    if userID is None:
        return redirect(url_for('login'))
    return render_template('homepage.html')


if __name__ == '__main__':
    app.run(debug=True)
    # app.debug = True