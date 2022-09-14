import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondApi extends StatefulWidget {
  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  getdata() async
  {
    Uri url = Uri.parse("https://api.storerestapi.com/users");
    var response = await http.get(url);
    //200 ok 400 api problem 500 server error
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      print(body);
    }
    else
    {
      print("API Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Products")),
      ),
    );
  }
}
