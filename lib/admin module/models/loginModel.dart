// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel LoginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    int loginid;
    String task;
    String type;

    LoginModel({
        required this.loginid,
        required this.task,
        required this.type,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        loginid: json["loginid"],
        task: json["task"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "loginid": loginid,
        "task": task,
        "type": type,
    };
}
