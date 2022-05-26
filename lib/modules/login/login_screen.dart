// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/main.dart';
import 'package:grad/modules/login/cubit/cubit.dart';
import 'package:grad/modules/login/cubit/states.dart';
import 'package:grad/modules/register/register.dart';
import 'package:grad/network/remote/dio_helper.dart';
import 'package:grad/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // emailCheck(){
  //   if (emailController.text == 'admin@test.com'){
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MyHome()),
  //     );
  //   }
  //   else if (emailController.text == 'user@test.com'){
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => User()),
  //     );
  //
  //   }
  //   else {
  //     var wrongEmail = print('Email not registered');
  //     return wrongEmail;
  //   }
  // }

  void loginUser() {
    if (this.emailController.text == 'admin@test.com' &&
        this.passwordController.text == 'P@ssw0rd') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHome()),
      );
    }
    else if (this.emailController.text == 'user@test.com' &&
        this.passwordController.text == 'P@ssw0rd') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => User()),
      );
    } else {
      rejectLogin();
    }
  }

  void rejectLogin() {
    AlertDialog alert = AlertDialog(
      content: Text("Login data is wrong."),
      actions: [
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/pic/top2.png',
                ),
                Image.asset(
                  'assets/pic/top1.png',
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(

                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/pic/greenlogo.png',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.blue[700],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password CAN NOT be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: Container(
                        width: 160.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.deepOrangeAccent,
                              Colors.amber,
                            ],
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            print('login button pressed');
                            print(emailController.text);
                            if (formKey.currentState!.validate()) {
                              loginUser();

                              // insertToDB(
                              //   email: emailController.text,
                              //   password: passwordController.text,
                              //   //.then means : lma el insert y5ls e3ml elly gwa then
                              // ).then((value) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyHome()),
                              //   );
                              // });
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text('$emailCheck().wrong'),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => register()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Sign up ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Center(
                    //   child: Container(
                    //     width: 160.0,
                    //     height: 40.0,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(
                    //         30.0,
                    //       ),
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topRight,
                    //         end: Alignment.bottomLeft,
                    //         colors: [
                    //           Colors.deepOrangeAccent,
                    //           Colors.amber,
                    //         ],
                    //       ),
                    //     ),
                    //     // child: MaterialButton(
                    //     //   onPressed: () {
                    //     //     print('user button pressed');
                    //     //
                    //     //     if (formKey.currentState!.validate()) {
                    //     //
                    //     //       // insertToDB(
                    //     //       //   email: emailController.text,
                    //     //       //   password: passwordController.text,
                    //     //       //   //.then means : lma el insert y5ls e3ml elly gwa then
                    //     //       // ).then((value) {
                    //     //       //   Navigator.push(
                    //     //       //     context,
                    //     //       //     MaterialPageRoute(
                    //     //       //         builder: (context) => MyHome()),
                    //     //       //   );
                    //     //       // });
                    //     //     }
                    //     //   },
                    //     //   child: Text(
                    //     //     'As User',
                    //     //     style: TextStyle(
                    //     //       color: Colors.white,
                    //     //       fontSize: 18.0,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ], //children of column
        ),
      ),
    );
  }
}
