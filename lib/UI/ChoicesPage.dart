import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Contracts/ChoicePageContract.dart';
import 'package:flutter_gmr_run/Contracts/LoginPresenterContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Data/User.dart';
import 'package:flutter_gmr_run/Presenter/ChoicePresenter.dart';
import 'package:flutter_gmr_run/Presenter/LoginPresenter.dart';
import 'package:flutter_gmr_run/UI/Dialog/ChoiceDialog.dart';
import 'package:flutter_gmr_run/UI/OrdersListPage.dart';

class ChoicesPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new ChoicesPageState();
  }

}

class ChoicesPageState extends State<ChoicesPage> implements ChoicePageContract,LoginPresenterContract{

  List<Choice> _listOfChoices;
  ChoicePresenter _choicePresenter;

  LoginPresenter _loginPresenter;

  User currentUser;

  @override
  void initState() {
    super.initState();
    _loginPresenter = new LoginPresenter(this);
    _choicePresenter = new ChoicePresenter(this);
    currentUser = _loginPresenter.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        appBar:new AppBar(title: new Text("List of Resturants"),),
        body:new ListView.builder(
          itemCount: _listOfChoices == null? 0:_listOfChoices.length,
          itemBuilder: (BuildContext context, int index){
            Choice choice = _listOfChoices[index];
            return new Dismissible(
                key: new Key(index.toString()),
                onDismissed: (direction){_listOfChoices.removeAt(index);},
                child: new Padding(padding: new EdgeInsets.all(8.0),
                    child: new GestureDetector(
                      onTap: (){_openDetailedOrdersList(choice);},
                      child: new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                                padding: new EdgeInsets.only(top: 8.0 , left: 12.0,bottom: 8.0),
                                child: new Text(choice.resturantName)),
                            new Padding(
                                padding: new EdgeInsets.only(top: 8.0, left: 24.0,bottom: 8.0),
                                child: new Text(choice.numberOfOrders.toString()))
                          ],
                        ),
                      ),
                    )
                )
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return new ChoiceDialog(_choicePresenter);}
          );
        }),
      )
    );
  }

  @override
  void onLoadChoices(List<Choice> choices) {
    setState(() {
      _listOfChoices = choices;
    });
  }

  void _openDetailedOrdersList(Choice choice) {
    Navigator.push(context,
        new MaterialPageRoute<OrdersListPage>(
          builder: (context) => new OrdersListPage(choice),
        )
    );
  }
}
