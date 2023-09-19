
import 'dart:convert';

class UserModel{
final String? name;
final String? email;
final String? id;
var createdAt;
var updatedAt;
final bool? logout;

UserModel({this.name,this.email,this.createdAt,this.id,this.logout,this.updatedAt});

factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    createdAt: json["createdAt"],
    logout: json["logout"],
    updatedAt: json["updatedAt"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "createdAt": createdAt,
    "logout": logout,
    "updatedAt": updatedAt,

  };
}
