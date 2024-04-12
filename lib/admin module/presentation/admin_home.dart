import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffics/user%20module/presentation/add_user.dart';
import 'package:traffics/admin%20module/presentation/admin_profile.dart';
import 'package:traffics/admin%20module/presentation/admin_reg.dart';
import 'package:traffics/admin%20module/presentation/constVariables.dart';
import 'package:traffics/admin%20module/presentation/manage_user.dart';
import 'package:traffics/admin%20module/presentation/view_alerts.dart';
import 'package:traffics/constants/sizedboxes.dart';

class Admin_home extends StatelessWidget {
  const Admin_home({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
      backgroundColor: Color.fromARGB(255, 20, 75, 121),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            h5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin_profile(),)),
                  child: IconButton(onPressed: (){}, icon:Icon(Icons.person),color: Colors.white,)),
                Text("Traffic Stats",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.white,)
              ],
            ),
            Container(
              height: h!*0.40,
              width: w       
            ),
            Expanded(
              child: Container(
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                ),
                child: Column(
                  children: [
                    h30,
                    h30,
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add_user(),)),
                      child: HomescreenButton(title: 'Add User',icon: Icons.person,)),
                    h20,
                    
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Manage_user(),)),
                      child: HomescreenButton(title: 'Manage Users',icon: Icons.person,)),
                    h20,

                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => View_alerts(),)),
                    child: HomescreenButton(title: 'View Alerts',icon: Icons.person,)),
                    h20,
                    HomescreenButton(title: 'Adjust Signals',icon: Icons.person,),
                    h20

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomescreenButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const HomescreenButton({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: w!*0.8,
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 243, 243, 232),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          w10,
          Icon(icon,color: Colors.blueAccent,),
          Expanded(child: Center(child: Container(child: Text(title,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color:Colors.black),)))),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45
              ),
              borderRadius: BorderRadius.circular(100)
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(Icons.arrow_forward_ios),
            ),),
            w10
        ],
      ),
    );
  }
}
