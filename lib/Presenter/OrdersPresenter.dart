import 'package:flutter_gmr_run/Contracts/OrderPageContract.dart';
import 'package:flutter_gmr_run/Contracts/OrdersContract.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';
import 'package:flutter_gmr_run/Data/ChoiceRepository.dart';
import 'package:flutter_gmr_run/Data/Order.dart';
import 'package:flutter_gmr_run/Data/OrdersRepository.dart';

class OrdersPresenter{
  OrderPageContract _ordersContract;
  OrdersRepository _ordersRepository;
  Choice _choice;
  OrdersPresenter(this._ordersContract, this._choice){
     _ordersRepository = new OrdersRepository(_choice);
     _ordersRepository.getListOfOrders().then((List<Order> orders){
       _ordersContract.onOrdersLoaded(orders);
    });
  }

}
