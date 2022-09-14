import 'package:apiproject/AnimalModel.dart';
import 'package:apiproject/AnimalView.dart';
import 'package:apiproject/ApiLoginPage.dart';
import 'package:apiproject/ReadApiJson.dart';
import 'package:apiproject/ViewEmployeeModel.dart';
import 'package:apiproject/ViewProductModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AddEmployee.dart';
import 'AddProduct.dart';
import 'ViewAnimalModel.dart';
import 'ViewEmployee.dart';
import 'ViewProduct.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var email="";
  var username="";
  var opname="";
  var uid="";
  var opemailver="";
  var txtusersession="";
  var txttoken="";
  var dos="";
  var fgratitude="";
  var fgratitudetime="";
  var txtrerescheduletime="";
  var servertime="";
  var txtstatus="";
  var txtversiontype="";
  var txtgroup="";
  var txtversion="";
  var txttimezone="";
  var txtaddress="";
  var txtcreated="";
  var txtupdated="";
  var lastlogin="";
  var txtexperience="";
  var srescheduletime="";
  var opaffirmation="";
  var txtaffirmationtime="";
  var saffirmationtime="";
  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email=prefs.getString("femail");
      username=prefs.getString("fuser");
      opname=prefs.getString("isname");
      uid= prefs.getString("fid");
      opemailver=prefs.getString("fvf");
      txttoken=prefs.getString("fdtoken");
      dos=prefs.getString("fdos");
      fgratitude=prefs.getString("gtitude");
      fgratitudetime=prefs.getString("gtitudetime");
      txtrerescheduletime=prefs.getString("sgtitude");
      servertime=prefs.getString("server");
      srescheduletime=prefs.getString("servergtitude");
      opaffirmation=prefs.getString("opaffir");
      txtaffirmationtime=prefs.getString("affirtime");
      saffirmationtime=prefs.getString("serveraffir");
      txtstatus=prefs.getString("isstatus");
      txtversiontype=prefs.getString("isversion");
      txtgroup=prefs.getString("isgroup");
      txtversion=prefs.getString("fversion");
      txttimezone=prefs.getString("zone");
      txtaddress=prefs.getString("ipadd");
      txtcreated=prefs.getString("ipcreate");
      txtupdated=prefs.getString("ipupdate");
      lastlogin=prefs.getString("iplogin");
      txtexperience=prefs.getString("ipsubmit");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(opname,style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,letterSpacing: 2)),
            GestureDetector(
              onTap: () async {
                AlertDialog alert = new AlertDialog(
                  title: Text("Warning!",style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.red,
                  content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white),),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "LOGOUT IS UNSUCCESSFULL",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }, child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                    TextButton(onPressed: () async{
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.clear();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>ApiLoginPage())
                      );
                      Fluttertoast.showToast(
                          msg: "LOGOUT IS SUCCESSFULL",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }, child: Text("Delete",style: TextStyle(color: Colors.white),)),
                  ],
                );
                showDialog(context: context, builder: (BuildContext context){
                  return alert;
                });
              },
                child: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0,),
                Image.asset("img/apipicture.jpg"),
                SizedBox(height: 50.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddProduct())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("ADD PRODUCT",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewProduct())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW PRODUCT",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewProductModel())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("PRODUCT WITH MODEL",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddEmployee())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("ADD EMPLOYEE",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewEmployee())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW EMPLOYEE",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewEmployeeModel())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("EMPLOYEE WITH MODEL",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ReadApiJson())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW API JSON",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AnimalView())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("VIEW ANIMAL JSON",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewAnimalModel())
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("ANIMAL JSON WITH MODEL",style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  setState(
                        () {
                      _isShow = !_isShow;
                    },
                  );
                },
                child: Text(
                  _isShow ? 'Hide' : 'View Details',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Visibility(
                visible: _isShow,
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Text(email),
                    SizedBox(height: 20.0,),
                    Text(username),
                    SizedBox(height: 20.0,),
                    Text(uid),
                    SizedBox(height: 20.0,),
                    Text(opemailver),
                    SizedBox(height: 20.0,),
                    Text(txttoken),
                    SizedBox(height: 20.0,),
                    Text(dos),
                    SizedBox(height: 20.0,),
                    Text(fgratitude),
                    SizedBox(height: 20.0,),
                    Text(fgratitudetime),
                    SizedBox(height: 20.0,),
                    Text(txtrerescheduletime),
                    SizedBox(height: 20.0,),
                    Text(servertime),
                    SizedBox(height: 20.0,),
                    Text(srescheduletime),
                    SizedBox(height: 20.0,),
                    Text(txtaffirmationtime),
                    SizedBox(height: 20.0,),
                    Text(saffirmationtime),
                    SizedBox(height: 20.0,),
                    Text(txtstatus),
                    SizedBox(height: 20.0,),
                    Text(txtversiontype),
                    SizedBox(height: 20.0,),
                    Text(txtgroup),
                    SizedBox(height: 20.0,),
                    Text(txtversion),
                    SizedBox(height: 20.0,),
                    Text(txttimezone),
                    SizedBox(height: 20.0,),
                    Text(txtaddress),
                    SizedBox(height: 20.0,),
                    Text(txtcreated),
                    SizedBox(height: 20.0,),
                    Text(txtupdated),
                    SizedBox(height: 20.0,),
                    Text(lastlogin),
                    SizedBox(height: 20.0,),
                    Text(txtexperience),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
