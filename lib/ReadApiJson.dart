import 'dart:convert';
import 'package:apiproject/AddEmployee.dart';
import 'package:apiproject/AddProduct.dart';
import 'package:apiproject/ViewEmployee.dart';
import 'package:apiproject/ViewProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
class ReadApiJson extends StatefulWidget {
  @override
  State<ReadApiJson> createState() => _ReadApiJsonState();
}
class _ReadApiJsonState extends State<ReadApiJson> {
  Future<List> alldata;
  Future<List> getdata() async
  {
    Uri url = Uri.parse("https://invicainfotech.com/apicall/mydata");
    var response = await http.get(url);
    //200 ok 400 api problem 500 server error
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      return json["contacts"];
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
    setState((){
      alldata = getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("JSON")),
      ),
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
          {
            if(snapshot.data.length<=0)
            {
              return Center(
                child: Text("No Data"),
              );
            }
            else
            {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index)
                {
                  return Column(
                    children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.blue),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Image.network(snapshot.data[index]["userimage"].toString(),width: 100.0,),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("id : "),
                                      Text(snapshot.data[index]["id"].toString()),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Text("Name : ",style: TextStyle(color: Colors.white),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 28.0),
                                        child: Text(snapshot.data[index]["name"]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Text("Email : ",style: TextStyle(color: Colors.white),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 28.0),
                                        child: Container(
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Text(snapshot.data[index]["email"].toString(),style: TextStyle(fontSize: 12),),
                                            ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Text("Address : ",style: TextStyle(color: Colors.white),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 28.0),
                                        child: Text(snapshot.data[index]["address"].toString()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Text("Female/",style: TextStyle(color: Colors.white),),
                                      Text("Male : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 28.0),
                                        child: Text(snapshot.data[index]["gender"].toString()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Text("Contact No : ",style: TextStyle(color: Colors.white),),
                                      Column(
                                        children: [
                                          Text(snapshot.data[index]["mobile"].toString(),style: TextStyle(color: Colors.white),),
                                          Text(snapshot.data[index]["home"].toString(),style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){},
                                          child: Text("Remove"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
          else
          {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.red,
                size: 50,
              ),
            );
          }
        },
      ),
    );
  }
}