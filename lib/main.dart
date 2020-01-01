import 'package:flutter/material.dart';
import 'package:raffle/Login_registration_screen/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login and registration boiler plate code',
      home: LoginPage(),
    );
  }
}

