class User{
  String id;
  String name;
  String password;
  bool isAdmin;

  User(this.name,this.password);

  static bool isValid(String userName) {
    return userName != null && userName.isNotEmpty;
  }
}