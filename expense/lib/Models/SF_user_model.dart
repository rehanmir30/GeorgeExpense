import 'dart:convert';

import 'package:flutter/foundation.dart';

class SFUserModel {
  final String? name;
  final String? email;
  final String? id;
  final String? createdAt; // Store date as a string
  final String? updatedAt; // Store date as a string
  final bool? logout;

  SFUserModel({
    this.name,
    this.email,
    this.id,
    this.createdAt,
    this.logout,
    this.updatedAt,
  });

  factory SFUserModel.fromJson(String str) => SFUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SFUserModel.fromMap(Map<String, dynamic> json) => SFUserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["createdAt"],
        logout: json["logout"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt,
        "logout": logout,
        "updatedAt": updatedAt,
      };

  // Add methods to convert createdAt and updatedAt to DateTime objects
DateTime? getCreatedAtAsDateTime(String? createdAtTime) {
  if (createdAtTime != null) {
    try {
      return DateTime.parse(createdAtTime);
    } catch (e) {
      // Handle parsing error, e.g., return null or provide a default date
      if (kDebugMode) {
        print("Error parsing create date: $e");
      }
    }
  }
  return null;
}


  DateTime? getUpdatedAtAsDateTime(updatedAtTime) {
    if (updatedAtTime != null) {
      try{
        return DateTime.parse(updatedAtTime!);
      }catch(e){
        if (kDebugMode) {
        print("Error parsing update date: $e");
      }
      }
    }
    return null;
  }
}
