import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gmr_run/Data/Choice.dart';

class Order{
  DocumentReference reference;
  String user;
  String order;
  String resturantName;


  Order(this.user, this.order);

  Order.data(this.reference,
//      [this.id,
//        this.resturantName,
//        this.numberOfOrders]) {
//    // Set these rather than using the default value because Firebase returns
//    // null if the value is not specified.
//    this.resturantName ??= 'New Resturant';
//    this.numberOfOrders ??= 0;
      this.order,
      this.user,
      this.resturantName);

  factory Order.from(DocumentSnapshot document, Choice choice) {
    String data = document.data["resturant_name"];
    if(document.data["resturant_name"] == choice.resturantName){
      return Order.data(
        document.reference,
        document.data['order'],
        document.data['user'],
        document.data['resturant_name']);
    }
  }
}
