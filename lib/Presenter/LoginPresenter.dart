import 'dart:async';

import 'package:flutter_gmr_run/Contracts/LoginPresenterContract.dart';
import 'package:flutter_gmr_run/Data/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPresenter {
  LoginPresenterContract loginContract;
  LoginPresenter(this.loginContract);
  User user;

  Future setUser(String userName, String password) async {
    user = new User(userName,password);
  }

  User getUser() {
    return user;
  }
}