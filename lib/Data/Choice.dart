class Choice {
  String id;
  int numberOfOrders;
  String resturantName;


  Choice(this.numberOfOrders, this.resturantName);

  static bool isValid(String newChoice) {
    return (newChoice != null && !newChoice.isEmpty);
  }
}