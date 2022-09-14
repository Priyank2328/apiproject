import 'dart:convert';
import 'package:apiproject/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLoginPage extends StatefulWidget {

  @override
  State<ApiLoginPage> createState() => _ApiLoginPageState();
}

class _ApiLoginPageState extends State<ApiLoginPage> {
  bool _obscureText = true;

  String _pwd;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Center(child: Image.asset("img/apiimage.jpeg")),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _name,
                obscureText: true,
                cursorColor: Colors.green,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.man),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("PassWord"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                validator: (val) => val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _pwd = val,
                obscureText: _obscureText,
                controller: _password,
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GestureDetector(
                      onTap: _toggle,
                        child: Text(_obscureText ? "Show" : "Hide"),
                    ),
                  ),
                  prefixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    var name = _name.text.toString();
                    var password = _password.text.toString();
                    Uri url = Uri.parse("https://begratefulapp.ca/api/login");
                    Map<String,String> params = {
                      "name": name,
                      "password": password,
                      "device_token":"12345678",
                      "device_os":"android"
                    };
                    Map<String,String> headers = {
                      "Content-Type": "application/json",
                    };
                    var response = await http.post(url,body: jsonEncode(params),headers: headers);
                    if(response.statusCode==200)
                    {
                      var json = jsonDecode(response.body);
                      if(json["result"]=="success")
                      {
                        var id = json["data"]["id"].toString();
                        var txtname = json["data"]["name"].toString();
                        var txtemail = json["data"]["email"].toString();
                        var emailvf = json["data"]["email_verified_at"].toString();
                        var user = json["data"]["user_session_token"].toString();
                        var dtoken = json["data"]["device_token"].toString();
                        var dos = json["data"]["device_os"].toString();
                        var passwordlock = json["data"]["password_lock"].toString();
                        var gratitude = json["data"]["gratitude"].toString();
                        var gratitudetime = json["data"]["gratitude_time"].toString();
                        var gratitudereschedule = json["data"]["gratitude_reschedule_time"].toString();
                        var servergratitudetime = json["data"]["server_gratitude_time"].toString();
                        var servergratitudereschedule = json["data"]["server_gratitude_reschedule_time"].toString();
                        var affirmation = json["data"]["affirmation"].toString();
                        var affirmationtime = json["data"]["affirmation_time"].toString();
                        var serveraffirmationtime = json["data"]["server_affirmation_time"].toString();
                        var status = json["data"]["status"].toString();
                        var versiontype = json["data"]["version_type"].toString();
                        var group = json["data"]["group"].toString();
                        var version = json["data"]["version"].toString();
                        var timezone = json["data"]["time_zone"].toString();
                        var ipaddress = json["data"]["ip_address"].toString();
                        var createdat = json["data"]["created_at"].toString();
                        var updatedat = json["data"]["updated_at"].toString();
                        var lastloginat = json["data"]["last_login_at"].toString();
                        var experiencesubmit = json["data"]["experience_submit"].toString();
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("fid", id);
                        pref.setString("isname", txtname);
                        pref.setString("femail", txtemail);
                        pref.setString("fvf", emailvf);
                        pref.setString("fuser", user);
                        pref.setString("fdtoken", dtoken);
                        pref.setString("fdos", dos);
                        pref.setString("password", passwordlock);
                        pref.setString("gtitude", gratitude);
                        pref.setString("gtitudetime", gratitudetime);
                        pref.setString("sgtitude", gratitudereschedule);
                        pref.setString("server", servergratitudetime);
                        pref.setString("servergtitude", servergratitudereschedule);
                        pref.setString("opaffir", affirmation);
                        pref.setString("affirtime", affirmationtime);
                        pref.setString("serveraffir", serveraffirmationtime);
                        pref.setString("isstatus", status);
                        pref.setString("isversion", versiontype);
                        pref.setString("isgroup", group);
                        pref.setString("fversion", version);
                        pref.setString("zone", timezone);
                        pref.setString("ipadd", ipaddress);
                        pref.setString("ipcreate", createdat);
                        pref.setString("ipupdate", updatedat);
                        pref.setString("iplogin", lastloginat);
                        pref.setString("ipsubmit", experiencesubmit);
                        pref.setString("islogin", "yes");
                        Fluttertoast.showToast(
                            msg: "YOUR LOGIN IS SUCCESSFULL",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>HomePage())
                        );
                      }
                      else
                      {
                        Fluttertoast.showToast(
                            msg: "Your Name And Password Are Wrong",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                  },
                  child: Text("Login"),
              ),
            ),
            Center(child: Text("OR")),
            Center(
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Login With Google"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
