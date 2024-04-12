import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:traffics/admin%20module/presentation/admin_home.dart';
import 'package:traffics/admin%20module/services/loginapi.dart';
import 'package:traffics/constants/constantVariables.dart';
import 'package:traffics/constants/sizedboxes.dart';
import 'package:traffics/user%20module/presentation/add_user.dart';
import 'package:traffics/user%20module/presentation/bottomNav.dart';
import 'package:traffics/user%20module/presentation/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginNinePage extends StatelessWidget {
  static const String path = "lib/src/pages/login/login9.dart";

  LoginNinePage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Cartoon Urban Traffic stock vector_ Illustration of travel - 28284019.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                if (MediaQuery.of(context).viewInsets == EdgeInsets.zero)
                  const Padding(
                    padding: EdgeInsets.only(top: kToolbarHeight),
                    child: Text(
                      "SmartFlow",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Animator<double>(
                  triggerOnInit: true,
                  curve: Curves.easeIn,
                  tween: Tween<double>(begin: -1, end: 0),
                  builder: (context, state, child) {
                    return FractionalTranslation(
                      translation: Offset(state.value, 0),
                      child: child,
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ListView(
                      physics:
                          MediaQuery.of(context).viewInsets == EdgeInsets.zero
                              ? const NeverScrollableScrollPhysics()
                              : null,
                      padding: const EdgeInsets.all(32.0),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: kToolbarHeight),
                        Text(
                          "Welcome.",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white)
                          ,textAlign: TextAlign.center,
                          
                        ),
                        const SizedBox(height: 10.0),
                        // const Text(
                        //   "Welcome to the app",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 16.0,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            suffixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        //const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: const Text("Forgot login info"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(30.0),
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 132, 238, 79),
              ),
              child: Text("LOGIN".toUpperCase()),
              onPressed: () {
                loginClicked(context);
              },
            ),
                        TextButton(
              
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add_user(),));
                          }, child:Text("Sign up",style: TextStyle(color: Colors.white),)),h10,
                          TextButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserHome(),));
                          }, 
                          child: Text("Login as guest",style: TextStyle(color: Colors.white),))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //if (MediaQuery.of(context).viewInsets == EdgeInsets.zero)
            
        ],
     ),
);
}


//login button clicked
loginClicked(BuildContext context) async{
  final res = await loginapicall(emailController.text, passwordController.text);
  final shared = await SharedPreferences.getInstance();
  print(res!.type);
  if (res != null) {
    if (res.type == "user") {
      await shared.setBool("islogedin", true);
      await shared.setString("loginid", res.loginid.toString());
      print("here");
      loginId = res.loginid.toString();
      print("login Id: $loginId");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomnavScreen()));
    }
    else if(res.type == "admin"){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Admin_home()));
    }
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Something went wrong."),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 5)));
  }
}

}
