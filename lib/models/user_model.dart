import 'package:get/get.dart';

class User {
  RxInt? id;
  String? email, name, pic;

  User({this.id, this.email, this.name, this.pic});

  User.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
