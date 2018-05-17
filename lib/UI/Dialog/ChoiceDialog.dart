import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Presenter/ChoicePresenter.dart';

class ChoiceDialog extends StatelessWidget{
  String _userInput;

  ChoicePresenter _presenter;

  ChoiceDialog(ChoicePresenter presenter){
    _presenter = presenter;
  }

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Text("Create a new resturant option"),
      children: <Widget>[
        new Padding(padding: new EdgeInsets.all(8.0)
        ,child:new Text("Enter a new resturant")),
        new Padding(padding: new EdgeInsets.all(8.0)
        ,child: new TextField(onChanged: (input){_userInput = input;}),),
        new Row(
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("Ok"),
                onPressed: (){
                  if(Choice.isValid(_userInput)){
                    _presenter.saveChoice(_userInput);
                  }
                  Navigator.pop(context);},
              ),
              new SimpleDialogOption(
                child: new Text("Cancel"),
                onPressed: (){Navigator.pop(context);},
              )
            ],
        )
      ],
    );
  }

}