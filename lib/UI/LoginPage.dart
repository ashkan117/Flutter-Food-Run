import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Contracts/LoginPresenterContract.dart';
import 'package:flutter_gmr_run/Data/User.dart';
import 'package:flutter_gmr_run/Presenter/LoginPresenter.dart';
import 'package:flutter_gmr_run/UI/ChoicesPage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget implements LoginPresenterContract{

  String _userName;
  String _password;

  LoginPresenter _loginPresenter;
  LoginPage(){
    _loginPresenter = new LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Login Page"),
          ),
          body: new Column(
              children: <Widget>[
              new Text("Please enter your username"),
              new TextField(onChanged: (userName){_userName = userName;},),
              new Text("Please enter your password"),
              new TextField(onChanged: (password){_password = password;},),

               new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(onPressed: () {_onOkPressed(context);},
                      child: new Text("Ok"),),
                    new RaisedButton(onPressed: (){_onCancelPressed(context);},
                      child: new Text("Cancel"),)  ,
                  ],
                ),
              ],),
          ),
      );
  }

  _onOkPressed(BuildContext context) {
    if(User.isValid(_userName)){
      saveUser(_userName,_password);
      Navigator.push(
        context,
        new MaterialPageRoute<ChoicesPage>(
          builder: (context) => new ChoicesPage(),
        ),
      );

    }
  }

  _onCancelPressed(BuildContext context) {}

  Future saveUser(String userName, String password) async {
    _loginPresenter.setUser(_userName,_password);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("KEY_USER", userName);
    sharedPreferences.setString("KEY_PASSWORD", password);
  }


}
