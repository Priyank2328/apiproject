import 'dart:convert';
import 'package:apiproject/Models/Employee.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ViewEmployeeModel extends StatefulWidget {
  @override
  State<ViewEmployeeModel> createState() => _ViewEmployeeModelState();
}
class _ViewEmployeeModelState extends State<ViewEmployeeModel> {
  List<Employee> alldata;
  getdata() async
  {
    Uri url = Uri.parse("http://picsyapps.com/studentapi/getEmployee.php");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState((){
        alldata = json["data"].map<Employee>((obj)=> Employee.fromJson(obj)).toList();
      });
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
        title: Text("Employee"),
      ),
      body: (alldata!=null)?ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text(alldata[index].eid.toString()),
                      Text(alldata[index].ename.toString()),
                      Text(alldata[index].salary.toString()),
                      Text(alldata[index].department.toString()),
                      Text(alldata[index].gender.toString()),
                      Text(alldata[index].addedDatetime.toString()),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ):
      Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}
