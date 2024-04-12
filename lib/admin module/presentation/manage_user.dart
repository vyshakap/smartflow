import 'package:flutter/material.dart';

class Manage_user extends StatelessWidget {
  const Manage_user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: true,
        title: Text("User Info"),),
      // backgroundColor: Color.fromARGB(255, 91, 163, 223),
      body:
      ListView.builder(itemBuilder: (context, index) {
        return ListTile(leading: CircleAvatar(),title:Text("User1"),subtitle: Text("abc@gmail.com"),trailing:IconButton(onPressed: (){}, icon:Icon(Icons.edit)),);
      },
      itemCount: 10,
      )
      );
  }
}