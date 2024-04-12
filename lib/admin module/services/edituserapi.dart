import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:traffics/constants/urls.dart';
import 'package:traffics/user%20module/models/regmodel.dart';

Future<void> edituserapi(UserRegModel user) async{
  var client=http.Client();
  final uri =Uri.parse("$baseUrl/edituser");
  try {
    Response response = await client.post(uri,
    body:{
      "username":"",
      "phone":"",
      "email":"",
      "rc_number":"",
      "adhar_number":"",
      "lid":""
    } 
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode>= 200 || response.statusCode<300){
      final body = jsonDecode(response.body);
      try {
        
      } catch (e) {
        print("error");
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

// "login_id")
//     name = request.form.get("username")
//     phn = request.form.get("phone")
//     email = request.form.get("email")
//     passwrd = request.form.get("password")
//     rc = request.form.get("rc_number")
//     adhr = request.form.get("adhaar_number")