import 'package:apiproject/ApiLoginPage.dart';
import 'package:apiproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomePage())
      );
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>ApiLoginPage())
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250.0,),
            Padding(
              padding: const EdgeInsets.all(88.0),
              child: Image.asset("img/apipicture.jpg"),
            ),
            SizedBox(height: 120.0,),
            Text("from",style: GoogleFonts.lato()),
            SizedBox(height: 20.0,),
            Text("Meta",style: GoogleFonts.montserrat(fontSize: 30.0,color: Colors.blue,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
