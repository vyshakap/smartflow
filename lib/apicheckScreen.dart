import 'package:flutter/material.dart';
import 'package:traffics/admin%20module/presentation/view_alerts.dart';
import 'package:traffics/admin%20module/services/changePasswordApi.dart';
import 'package:traffics/admin%20module/services/controlviewapi.dart';
import 'package:traffics/admin%20module/services/deleteuserApi.dart';
import 'package:traffics/admin%20module/services/edituserapi.dart';
import 'package:traffics/admin%20module/services/livestatsApi.dart';
import 'package:traffics/admin%20module/services/user_profile.dart';
import 'package:traffics/admin%20module/services/vieallAlerts.dart';
import 'package:traffics/admin%20module/services/viewallusers.dart';
import 'package:traffics/admin%20module/services/viewuserAlerts.dart';
import 'package:traffics/constants/sizedboxes.dart';

class ApiCheck extends StatelessWidget {
  const ApiCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          h30,
          ElevatedButton(onPressed: () {
            viewallUsersapi();
          }, child: Text("view all users")),h10,
          ElevatedButton(onPressed: () {
            //edituserapi(user);
          }, child: Text("edit user")),h10,
          ElevatedButton(onPressed: () {
            deleteuseapi();
          }, child: Text("delete user")),h10,
          ElevatedButton(onPressed: () {
            viewallalertsapi();
          }, child: Text("view alerts")),h10,
          ElevatedButton(onPressed: () {
            getuserprofileapi();
          }, child: Text("user profile")),h10,
          ElevatedButton(onPressed: () {
            changepasswordapi();
          }, child: Text("change password")),h10,
          ElevatedButton(onPressed: () {
            livestatsapi();
          }, child: Text("live stats")),h10,
          ElevatedButton(onPressed: () {
            controlviewapi();
          }, child: Text("control_view")),h10,
          ElevatedButton(onPressed: () {
              viewuseralertsapi();
          }, child: Text("view_user_alerts")),h10,
        ],
      ),
    );
  }
}