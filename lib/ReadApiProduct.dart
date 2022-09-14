import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ReadApiProduct extends StatefulWidget {
  @override
  State<ReadApiProduct> createState() => _ReadApiProductState();
}

class _ReadApiProductState extends State<ReadApiProduct> {
  getdata() async
  {
    Uri url = Uri.parse("https://invicainfotech.com/apicall/mydata");
    // https://invicainfotech.com/apicall/mydata
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
