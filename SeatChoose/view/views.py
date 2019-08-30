from flask import request, render_template, redirect, url_for, session
from flask import flash
from flask.views import MethodView
from scy import db


class LoginView(MethodView):
    def get(self):
        if session.get('admin', None):
            import time
            time.sleep(1)
            return redirect(url_for('hello_world'))
        return render_template('login.html')

    def post(self):
        username = request.form.get('username', None)
        pwd = request.form.get('pwd', None)
        from model.models import Student
        student = db.session.query(Student).filter(Student.studentID == username).first()

        if student:
            ID_card = student.ID_card
            if ID_card[-6:] == pwd:
                session['admin'] = username
                return redirect(url_for('login'))
            else:
                flash('密码输错了哟')
                return render_template('login.html')
        else:
            flash('您的账户不存在，请重新核对')
            return render_template('login.html')


class LogoutView(MethodView):
    def get(self):
        username = session.get('admin', None)
        if username:
            session.pop('admin')
        return render_template('login.html')




