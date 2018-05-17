import 'dart:async';

import 'package:flutter_gmr_run/Contracts/OrdersContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Data/Order.dart';

class OrdersRepository implements OrdersContract{

  List<Order> _listOfOrders;

  OrdersRepository(Choice choice){
    List<Order> orders;
    switch(choice.resturantName){
      case "Chipotle" :
        orders = [
          new Order("Ashkan", "Steak"),
          new Order("Robert", "Chicken"),
          new Order("Ashkan", "Steak Salad"),
          new Order("Robert", "Chicken Salad"),
        ];
    }
    _listOfOrders = orders;
  }

  @override
  Future<List<Order>> getListOfOrders() async {
    return await new Future.value(_listOfOrders);
  }


}