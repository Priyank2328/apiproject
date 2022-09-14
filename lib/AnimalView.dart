import 'dart:convert';

import 'package:apiproject/AnimalProject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
class AnimalView extends StatefulWidget {
  @override
  State<AnimalView> createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  Future<List> alldata;
  Future<List> getdata() async
  {
    Uri url = Uri.parse("https://zoo-animal-api.herokuapp.com/animals/rand/10");
    var response = await http.get(url);
    //200 ok 400 api problem 500 server error
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      return json;
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
        title: Text("Animal"),
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
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>AnimalProject(
                                  txtname: snapshot.data[index]["name"].toString(),
                                  txtlatinname: snapshot.data[index]["latin_name"].toString(),
                                  txtimage: snapshot.data[index]["image_link"].toString(),
                                  txtdiet: snapshot.data[index]["diet"].toString(),
                                  type: snapshot.data[index]["animal_type"].toString(),
                                  time: snapshot.data[index]["active_time"].toString(),
                                  lmin: snapshot.data[index]["length_min"].toString(),
                                  lmax: snapshot.data[index]["length_max"].toString(),
                                  wmin: snapshot.data[index]["weight_min"].toString(),
                                  wmax: snapshot.data[index]["weight_max"].toString(),
                                  txtlifespan: snapshot.data[index]["lifespan"].toString(),
                                  txthabitat: snapshot.data[index]["habitat"].toString(),
                                  txtgeorange: snapshot.data[index]["geo_range"].toString(),
                                  aid: snapshot.data[index]["id"].toString(),
                                ),
                              ),
                              );
                            },
                            child: Card(
                              color: Colors.lightBlueAccent,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image.network(snapshot.data[index]["image_link"].toString(),width: 100.0,),
                                  ),
                                  SizedBox(height: 20.0,),
                                  Text(snapshot.data[index]["name"].toString()),
                                  SizedBox(height: 20.0,),
                                  Text(snapshot.data[index]["latin_name"].toString()),
                                  SizedBox(height: 20.0,),
                                  Text(snapshot.data[index]["diet"].toString()),
                                ],
                              ),
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