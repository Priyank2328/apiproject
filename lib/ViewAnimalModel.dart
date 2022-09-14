import 'dart:convert';

import 'package:apiproject/Models/Animal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
class ViewAnimalModel extends StatefulWidget {
  @override
  State<ViewAnimalModel> createState() => _ViewAnimalModelState();
}

class _ViewAnimalModelState extends State<ViewAnimalModel> {
  List<Animal> alldata;

  getdata() async
  {
    Uri url = Uri.parse("https://zoo-animal-api.herokuapp.com/animals/rand/10");
    var response = await http.get(url);
    //200 ok 400 api problem 500 server error
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState((){
        alldata = json.map<Animal>((obj)=> Animal.fromJson(obj)).toList();
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
        title: Text("Animal"),
      ),
      body: (alldata!=null)?ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image.network(alldata[index].imageLink.toString(),width: 100.0,),
                          ),
                          SizedBox(height: 20.0,),
                          Text(alldata[index].name.toString()),
                          SizedBox(height: 20.0,),
                          Text(alldata[index].latinName.toString()),
                          SizedBox(height: 20.0,),
                          Text(alldata[index].diet.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ):
      Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}