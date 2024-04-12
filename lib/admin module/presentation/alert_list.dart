import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:traffics/constants/sizedboxes.dart';

class Alert_list extends StatelessWidget {
  const Alert_list({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        ListView.builder(
          itemBuilder: (context, index) => 
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.circle,size: 15,color: Color.fromARGB(255, 91, 163, 223),), w10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Emergency Alert!!!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          h5,
                          Text("Mar 27 2024 at 12.48 PM",style: TextStyle(color: Color.fromARGB(158, 33, 36, 31),fontWeight: FontWeight.w600),),
                        ],
                      )],),
                
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.location_on,color:Color.fromARGB(255, 91, 163, 223)))
                  ],
                ),
                h10,
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,0),
                  child: Divider(),
                )
              ],
            ),
          ),
            itemCount: 10,
          );
}
}
