import 'package:apiproject/ReadApiProduct.dart';
import 'package:apiproject/SecondApi.dart';
import 'package:flutter/material.dart';
import 'ApiLoginPage.dart';
import 'HomePage.dart';
import 'ReadApiJson.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiLoginPage(),
    );
  }
}