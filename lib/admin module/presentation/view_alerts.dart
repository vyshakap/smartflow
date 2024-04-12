import 'package:flutter/material.dart';
import 'package:traffics/admin%20module/presentation/alert_list.dart';

class View_alerts extends StatefulWidget {
  @override
  _View_alertsState createState() => _View_alertsState();
}

class _View_alertsState extends State<View_alerts> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true
        title: Text("Alerts",style: TextStyle(fontWeight: FontWeight.bold),)
        ,automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 91, 163, 223),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Color.fromARGB(255, 226, 232, 233)
          ),
          controller: _tabController,
          tabs: [
            Tab(child: Text("All",style: TextStyle(color: Colors.black38,fontSize: 14,fontWeight: FontWeight.w600),),icon: Icon(Icons.all_inbox),),
            Tab(child: Expanded(child: Text("Vehicle Alerts",style: TextStyle(color: Colors.black38,fontSize: 14,fontWeight: FontWeight.w600))),icon: Icon(Icons.car_crash_outlined),),
            Tab(child: Text("Congestion",style: TextStyle(color: Colors.black38,fontSize: 14,fontWeight: FontWeight.w600)),icon: Icon(Icons.traffic),),
          ],
        ),
      ),
      
      body: TabBarView(
        controller: _tabController,
        children: [      
          Alert_list(),

        ],
    ),
);
}
}
