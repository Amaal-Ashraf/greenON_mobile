// ignore_for_file: prefer_const_constructors
//import 'package:device_preview/device_preview.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/DB_list.dart';
import 'package:grad/modules/home/homescreen.dart';
import 'package:grad/modules/login/login_screen.dart';
import 'package:grad/network/remote/dio_helper.dart';
import 'package:grad/portState.dart';
import 'package:grad/ports.dart';
import 'package:grad/modules/register/register.dart';
import 'package:grad/modules/screenone/screenone.dart';
import 'package:grad/modules/screentwo/screentwo.dart';
import 'package:grad/shared/components/components.dart';
import 'package:grad/solarPanels.dart';
import 'package:grad/solarScreen.dart';
import 'package:grad/testBattery.dart';
import 'package:grad/user.dart';
import 'package:grad/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
SharedPreferences? sharedPreferences;
void main() async{

  // DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: register(),
      //home: LoginScreen(),
      //home: HomePage(),
      // home: screenOne(),
      //home: solarScreen(),
      //home: Ports(),
      // home: User(),
      //home: PortState(),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final screens = [HomePage(), screenOne(), screenTwo(), PortState()];
  int index = 0;
  final items = [
    Icon(
      Icons.home,
      size: 30,
    ),
    Image.asset(
      'assets/pic/panel.png',
      height: 30,
      width: 30,
    ),
    Image.asset(
      'assets/pic/panel.png',
      height: 30,
      width: 30,
    ),
    Icon(
      Icons.table_chart,
      size: 30,
    ),
    //Icon(Icons.notifications_active, size: 30,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.amberAccent)),
        child: CurvedNavigationBar(
          color: Color(0xFF2F3180),
          buttonBackgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          height: 50,
          items: items,
          index: index,
          onTap: (index) => setState(() => this.index = index,
          ),
        ),
      ),
    );
  }


}

//darkBlue 0xFF2F3180
//lightBlue 0xFF4A87E2
//lighterBlue 0xFF7EE6DE
//darkYellow 0xFFFCCF14
//yellow 0xFFFFE169


/*
* if(response.statusCode == 200){
* print(response.data.message.toString())
* }
* */