import 'dart:convert';
import 'package:apiproject/UpdateProduct.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
class ViewProduct extends StatefulWidget {
  @override
  State<ViewProduct> createState() => _ViewProductState();
}
class _ViewProductState extends State<ViewProduct> {
  Future<List> alldata;
  Future<List> getdata() async
  {
    Uri url = Uri.parse("http://picsyapps.com/studentapi/getProducts.php");
    var response = await http.get(url);
    //200 ok 400 api problem 500 server error
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      return json["data"];
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
        title: Center(child: Text("Products")),
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
                        child: Card(
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              Text(snapshot.data[index]["pid"].toString()),
                              Text(snapshot.data[index]["pname"].toString()),
                              Text(snapshot.data[index]["qty"].toString()),
                              Text(snapshot.data[index]["price"].toString()),
                              Text(snapshot.data[index]["added_datetime"].toString()),
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
                                      onPressed: () {},
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
                                              var id = snapshot.data[index]["pid"].toString();
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
              );
            }
          }
          else
          {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
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
