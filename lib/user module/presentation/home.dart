import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffics/admin%20module/models/traficHistoryModel.dart';
import 'package:traffics/admin%20module/presentation/constVariables.dart';
import 'package:traffics/admin%20module/services/trafficControlHistory.dart';
import 'package:traffics/constants/sizedboxes.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});
  

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var rtos = [
    'Select Route',
    'Kozhikode - Vadakara',
    'Kozhikode - Kannur',
    'Quilandy - Kozhikode',
    'Kuttiady - Vadakara',
  ];
  String dropdownvalue = 'Select Route';
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: ,
      body: 
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
            
            height: h!*0.4,
            width: w!,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 14, 59, 96),
              border: Border.all(style: BorderStyle.none),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon:Icon(Icons.person_2,color: Colors.white,)),
                      ],
                    ),
                    // IconButton(onPressed: (){}, icon:Icon(Icons.notifications),color: Colors.white,),  
                  ],  
                ),
                Text('LIVE STATS',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],
            ),
            

            
          ),h25,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Route",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),h10,
              
                Container(
                  
                                height: 40,
                                width: w!*0.8,
                                decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(7),color: Color.fromARGB(179, 239, 212, 212)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text("Select Route"),
                                    value : dropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                  
                                    // Array list of items
                                    items: rtos.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                ),
                h10,
                Center(
                  child: InkWell(
                    onTap: () { trafficControlHistoryapi(his);},
                    child: Container(
                      width: w!*0.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Text("Start",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            
                     ],
              
            ),
          )

        ],
      
      )

    );
  }
}

final his = TrafficHistory(time: "12:00:00", location: "abc", date: "01/01/2024", route: "kkd", lid: "5");