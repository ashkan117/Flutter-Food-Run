import 'dart:async';

import 'package:flutter_gmr_run/Data/Order.dart';

abstract class OrdersContract{
  Future<List<Order>> getListOfOrders();
}