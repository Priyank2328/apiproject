import 'dart:convert';
import 'package:apiproject/Models/Products.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'UpdateProduct.dart';

class ViewProductModel extends StatefulWidget {
  @override
  State<ViewProductModel> createState() => _ViewProductModelState();
}

class _ViewProductModelState extends State<ViewProductModel> {
  List<Products> alldata;
  getdata() async
  {
    Uri url = Uri.parse("http://picsyapps.com/studentapi/getProducts.php");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState((){
        alldata = json["data"].map<Products>((obj)=> Products.fromJson(obj)).toList();
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
        title: Text("Model Product"),
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
                      Text(alldata[index].pid.toString()),
                      Text(alldata[index].pname.toString()),
                      Text(alldata[index].qty.toString()),
                      Text(alldata[index].price.toString()),
                      Text(alldata[index].addedDatetime.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: ElevatedButton(
                                child: Text("Update"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>UpdateProduct(updateid: alldata[index].pid.toString(),))
                                  );
                                },
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: ElevatedButton(
                              onPressed: (){
                                AlertDialog alert = new AlertDialog(
                                  title: Text("Warning!",style: TextStyle(color: Colors.white),),
                                  backgroundColor: Colors.red,
                                  content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white),),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                                    TextButton(onPressed: () async{
                                      var id = alldata[index].pid.toString();
                                      Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteProductNormal.php");
                                      Map<String,String> params = {
                                        "pid":id
                                      };
                                      var response = await http.post(url,body: params);
                                      if(response.statusCode==200)
                                      {
                                        var json = jsonDecode(response.body);
                                        if(json["status"]=="true")
                                        {
                                          Navigator.of(context).pop();
                                          setState((){
                                            alldata = getdata();
                                          });
                                          Fluttertoast.showToast(
                                              msg: "YOUR DATA IS CLEAR",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        }
                                        else
                                        {
                                          var msg=json["message"];
                                          print(msg);
                                        }
                                      }
                                    }, child: Text("Delete",style: TextStyle(color: Colors.white),)),
                                  ],
                                );
                                showDialog(context: context, builder: (BuildContext context){
                                  return alert;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: Text("Remove"),
                            ),
                          ),
                        ],
                      ),
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
