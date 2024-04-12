import 'package:flutter/material.dart';

class adduser extends StatelessWidget {
  adduser({super.key});
  TextEditingController rcownercontroller=TextEditingController();
  TextEditingController numbercontroller=TextEditingController();
  TextEditingController phonecontroller =TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register User"),backgroundColor: Color.fromARGB(255, 228, 247, 134),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "field required";
                  }
                },
                controller:rcownercontroller,
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  // helperText: "Rc Owner Name",
                  labelText: "Rc Owner",
                ),
              ),SizedBox(height: 30,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return
                    "field is required"; 
                  }
                },
                controller: numbercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // helperText: "Enter Vechicle Number",
                  labelText: "Vechicle Number",
          
                ),
              ),SizedBox(height: 30,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return
                    "field cant be empty";
                  }
                },
                controller: phonecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // helperText: "Enter Phone Number",
                  labelText: "Phone Number",
                ),
              ),SizedBox(height: 30,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "field required";
                  }
                  // if (isValidEmail(value.toString()) == false) {
                  //   return "enter a valid email";
                    
                  // }
                },
                controller: emailcontroller,
                decoration: InputDecoration(
                  // helperText: "Enter Email",
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                if (_formkey.currentState!.validate()) {
                  print("success");
                }
                else{
                  print("failed");
                }

          
              }, child: Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}