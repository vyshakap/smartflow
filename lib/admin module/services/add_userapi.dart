import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:traffics/constants/urls.dart';
import 'package:traffics/user%20module/models/regmodel.dart';
Future<String?> adduserapicall(UserRegModel user) async{
  var client = http.Client();
  final uri= Uri.parse("$baseUrl/userregister");
  print(user.adhaar_number);
  try {
    final response=await http.post(uri,
    body: {"username":user.name,
           "phone":user.phone.toString(),
           "email":user.email,
           "rc_number":user.rc_number.toString(),
           "adhaar_number":user.adhaar_number.toString(),
           "password":user.password
    }
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode>=200 && response.statusCode<=300) {
      // final body= jsonDecode(response.body);
      return "success";
    }
    else{
      print("registration not successful");
      return null;
    }

  } catch (e) {
    print(e);
    return null;
    
  }
}