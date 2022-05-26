// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grad/network/remote/dio_helper.dart';

class PortState extends StatefulWidget {
  @override
  State<PortState> createState() => _PortStateState();
}

class _PortStateState extends State<PortState> {

  var portOne= {
    'name':'',
    'status':'',
  };
  var portTwo = {
    'name':'',
    'status':'',
  };
  var portThree = {
    'name':'',
    'status':'',
  };

  Future fetchPanelOData() async {

    var response= await DioHelper.getHttp(endPoint: 'ports');
    print('Response from ports widget:');
    print(response);

    setState(() {
      portOne = {
        'name':response['ports'][0]['name'].toString(),
        'status':response['ports'][0]['status'].toString(),
      };
      portTwo = {
        'name':response['ports'][1]['name'].toString(),
        'status':response['ports'][1]['status'].toString(),
      };
      portThree = {
        'name':response['ports'][2]['name'].toString(),
        'status':response['ports'][2]['status'].toString(),
      };
    });

    // bool portOneStatus ;
    // bool portTwoStatus ;
    // bool portThreeStatus;

    if (response['ports'][0]['status'] == 'available'){
      portOneStatus = true;
    } else {
      portOneStatus = false;
    }

    if (response['ports'][1]['status'] == 'available'){
      portTwoStatus = true;
    } else {
      portTwoStatus = false;
    }

    if (response['ports'][2]['status'] == 'available'){
      portThreeStatus = true;
    } else {
      portThreeStatus = false;
    }


    } //end of fetchPanelOData



  @override
  void initState() {
    super.initState();
    // Add listeners to this class

    fetchPanelOData();

  }

  @override

  late bool portOneStatus =false ;
  late bool portTwoStatus =false;
  late bool portThreeStatus=false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF2F3180),
                          Color(0xFF4A87E2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            //headers
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Port',
                                    style: TextStyle(
                                        color: Color(0xFF2F3180),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                          color: Color(0xFF2F3180),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(height: 10,),
                            //table content
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${portOne['name']}',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: (portOneStatus)? Colors.green : Colors.red,
                                      ),
                                      child: Text(
                                        '${portOne['status']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${portTwo['name']}',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: (portTwoStatus)? Colors.green : Colors.red,
                                      ),
                                      child: Text(
                                        '${portTwo['status']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${portThree['name']}',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:(portThreeStatus)? Colors.green : Colors.red ,
                                      ),
                                      child: Text(
                                        '${portThree['status']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
