import 'package:flutter/material.dart';
import 'package:flutter_gmr_run/Contracts/OrderPageContract.dart';
import 'package:flutter_gmr_run/Contracts/OrdersContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Data/Order.dart';
import 'package:flutter_gmr_run/Presenter/OrdersPresenter.dart';

class OrdersListPage extends StatefulWidget{
  final Choice _choice;

  OrdersListPage(this._choice);

  @override
  State<StatefulWidget> createState() {
    return new OrdersListPageState(_choice);
  }

}

class OrdersListPageState extends State<OrdersListPage> implements OrderPageContract {
  Choice _choice;
  List<Order> _orders;
  OrdersPresenter _ordersPresenter;

  OrdersListPageState(this._choice){
    _ordersPresenter = new OrdersPresenter(this,_choice);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(_choice.resturantName + " Orders"),),
      body: new ListView.builder(
          itemCount: _orders == null?0:_orders.length,
          itemBuilder: (BuildContext context, int index){
            Order order = _orders[index];
            return new Dismissible(key: new Key(index.toString()),
                onDismissed: (direction){_orders.removeAt(index);},
                child: new Card(
                  child: new Column(
                    children: <Widget>[
                      new Text(order.order),
                      new Text(order.orderByUser),
                    ],
                  ),
                )
            );
          }),
    );
  }


  @override
  void onOrdersLoaded(List<Order> orders) {
    setState(() {
      _orders = orders;
    });
  }

}