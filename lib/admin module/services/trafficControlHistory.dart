import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:traffics/admin%20module/models/traficHistoryModel.dart';
import 'package:traffics/constants/urls.dart';
import 'package:traffics/user%20module/models/regmodel.dart';

Future<void> trafficControlHistoryapi(TrafficHistory his) async{
  var client=http.Client();
  final uri =Uri.parse("$baseUrl/traffic_control");
  try {
    Response response = await client.post(uri,
    body:{
      "time":his.time,
      "date":his.date,
      "location":his.location,
      "route":his.route,
      "login_id":his.lid,
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