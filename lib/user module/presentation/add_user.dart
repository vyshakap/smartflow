import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffics/admin%20module/presentation/constVariables.dart';
import 'package:traffics/admin%20module/services/add_userapi.dart';
import 'package:traffics/constants/sizedboxes.dart';
import 'package:traffics/user%20module/models/regmodel.dart';
import 'package:traffics/widget/customtextfield.dart';

class Add_user extends StatelessWidget {
  Add_user({super.key});

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController rccontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController adhaarcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Color.fromARGB(255, 91, 163, 223),
      body: Form(
        key: _formkey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h!*0.02,),
            Text("   Register",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight:FontWeight.bold ),),//SizedBox(height: h!*0.01),
            Text("   New user",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
            SizedBox(height: h!*0.03,),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0,5,8,20),
                child: Container(
                  //height: 540,
                  width: 299,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 248, 247, 244)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                    child: Column(
                      children: [
                        buildTextField(context,"Enter Username",usernamecontroller,'Username'),h15,
                        buildTextField(context,"Enter Phone",phonecontroller,'Phone'),h15,
                        buildTextField(context,"Enter Email",emailcontroller,'Email'),h15,
                        buildTextField(context,"Enter Rc Number",rccontroller,'RC Number'),h15,
                        buildTextField(context,"Enter Adhaar Number",adhaarcontroller,'Adhaar Number'),h15,
                        buildTextField(context,"Enter Password",passwordcontroller,'Password'),h15,
                        buildTextField(context,"Confirm Password",confirmpasscontroller,'Confirm Password'),h15,
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 155, 197, 232),),
                          child: TextButton(onPressed: () async{
                            await regclicked(context);
                          }, child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //regButton clicked
  regclicked(BuildContext context) async{
    final user = UserRegModel(
      name: usernamecontroller.text, 
      email: emailcontroller.text, 
      password: passwordcontroller.text, 
      phone: int.parse(phonecontroller.text), 
      adhaar_number: int.parse(adhaarcontroller.text), 
      rc_number: rccontroller.text
      );
      
      print("email : ${user.email}");
      print("name : ${user.name}");
      print("password : ${user.password}");
      print("rc : ${user.rc_number}");
      print("adhar : ${user.adhaar_number}");
      print("phone : ${user.phone}");
      

    final result = await adduserapicall(user);
    if (result!=null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Registered"),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(10),
      ));
      Navigator.of(context).pop();
    }
    else{
      print("registrstion failed");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration failed"),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(10),
      ));

    }
  }
}