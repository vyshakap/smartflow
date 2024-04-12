import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:traffics/admin%20module/models/loginModel.dart';
import 'package:traffics/constants/urls.dart';

Future<LoginModel?> loginapicall(String email,String password) async{
  var client=http.Client();
  final uri =Uri.parse("$baseUrl/logincheck?email=$email&password=$password");
  try {
    Response response = await client.get(uri);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode>= 200 || response.statusCode<300){
      final body = jsonDecode(response.body);
      if (body["task"] == "success") {
        print("success : $body");
        final res = LoginModel.fromJson(body);
        return res;
      }
      else{
        print("invalid : $body");
        return null;
      }
    }
    else{
      print("api call error");
      return null;
    }
  } catch (e) {
      print(e);
      return null;
  }
}