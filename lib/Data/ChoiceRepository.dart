import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Contracts/ChoiceRepositoryContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';

class ChoiceRepository implements ChoiceRepositoryContract{
  List<Choice> listOfChoices = [
    new Choice(0,"Chipotle"),
    new Choice(0,"McDonald's"),
    new Choice(0,"Whole Food's"),
    new Choice(0,"Liquor Store"),
  ];

  ChoiceRepository();

  @override
  Future<List<Choice>> getChoiceList() async {

    // final mainReference = FirebaseDatabase.instance.reference();

    return await new Future.value(listOfChoices);
  }



}

