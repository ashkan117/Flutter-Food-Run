import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Data/User.dart';
import 'package:flutter_gmr_run/UI/ChoicesPage.dart';
import 'package:flutter_gmr_run/UI/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());


class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  bool _isLoggedIn = false;


  @override
  void initState() {
    _checkIfLoggedIn().then((boolean){
      setState(() {
        _isLoggedIn = boolean;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Food Run",
        home: _isLoggedIn ? new ChoicesPage() : new LoginPage()
    );
  }

  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user = sharedPreferences.getString("KEY_USER");
    return User.isValid(user);
  }

}
