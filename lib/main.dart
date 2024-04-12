import 'package:flutter/material.dart';
import 'package:traffics/apicheckScreen.dart';
import 'package:traffics/user%20module/presentation/add_user.dart';
import 'package:traffics/admin%20module/presentation/admin_profile.dart';
import 'package:traffics/admin%20module/presentation/alert_list.dart';
import 'package:traffics/admin%20module/presentation/manage_user.dart';
import 'package:traffics/admin%20module/presentation/traffic_login.dart';
import 'package:traffics/admin%20module/presentation/view_alerts.dart';
import 'package:traffics/admin%20module/presentation/admin_home.dart';
import 'package:traffics/admin%20module/presentation/admin_reg.dart';
import 'package:traffics/user%20module/presentation/bottomNav.dart';
import 'package:traffics/user%20module/presentation/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
        BottomnavScreen()
        //ApiCheck()
      // Manage_user()
      // Add_user()
      // adduser()
      // UserHome()
      //Add_user(),
    //Admin_home()
     // LoginNinePage()
    // Admin_profile()
    );
  }
}
