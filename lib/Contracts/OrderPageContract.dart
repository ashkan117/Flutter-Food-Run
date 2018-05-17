import 'package:flutter_gmr_run/Data/Order.dart';

abstract class OrderPageContract{
  void onOrdersLoaded(List<Order> orders);
}