class User {
  int? id;
  String? name;
 
  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> data) {//conveterndo de json para object
    return User(id: data["id"], name: data["name"]);
  }
}
