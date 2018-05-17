import 'dart:async';

import 'package:flutter_gmr_run/Contracts/ChoicePageContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Data/ChoiceRepository.dart';
import 'package:flutter_gmr_run/Data/Order.dart';

class ChoicePresenter{
  ChoicePageContract _contract;

  List<Choice> _listOfChoices;
  ChoiceRepository _repository;


  ChoicePresenter(ChoicePageContract contract) {
    _contract = contract;
    _repository = new ChoiceRepository();
    _repository.getChoiceList().then((List<Choice> list){
      _listOfChoices = list;
      _contract.onLoadChoices(_listOfChoices);
    });
    
    contract.onLoadChoices(_listOfChoices);
  }

  void saveChoice(String newChoice) {
    _listOfChoices.add(new Choice(0,newChoice));
  }
}