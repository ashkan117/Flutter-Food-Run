import 'package:cloud_firestore/cloud_firestore.dart';

class Choice {
  final DocumentReference reference;
  String id;
  int numberOfOrders;
  String resturantName;


  Choice(this.numberOfOrders, this.resturantName);
  Choice.fromJSON(Map data){
    id = data["id"];
    numberOfOrders = data["number_of_orders"];
    resturantName = data["resturant_name"];
  }

  Choice.data(this.reference,
//      [this.id,
//        this.resturantName,
//        this.numberOfOrders]) {
//    // Set these rather than using the default value because Firebase returns
//    // null if the value is not specified.
//    this.resturantName ??= 'New Resturant';
//    this.numberOfOrders ??= 0;
      this.resturantName,
      this.numberOfOrders);

  factory Choice.from(DocumentSnapshot document) => Choice.data(
      document.reference,
      document.data['resturant_name'],
      document.data['number_of_orders'],);



  static bool isValid(String newChoice) {
    return (newChoice != null && !newChoice.isEmpty);
  }

}