import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class AnimalProject extends StatefulWidget {
  var txtname="";
  var txtlatinname="";
  var txtimage="";
  var txtdiet="";
  var type="";
  var time="";
  var lmin="";
  var lmax="";
  var wmin="";
  var wmax="";
  var txtlifespan="";
  var txthabitat="";
  var txtgeorange="";
  var aid="";
  AnimalProject({this.txtname,this.txtlatinname,this.txtimage,this.txtdiet,this.type,this.time,this.lmin,this.lmax,this.wmin,
    this.wmax,this.txtlifespan,this.txthabitat,this.txtgeorange,this.aid});
  @override
  State<AnimalProject> createState() => _AnimalProjectState();
}
class _AnimalProjectState extends State<AnimalProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green,
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Card(
                    child: Image.network(
                      widget.txtimage,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Name : "),
                    Text(widget.txtname),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Latin Name : "),
                    Text(widget.txtlatinname),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Diet : "),
                    Expanded(child: Text(widget.txtdiet)),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Type : "),
                    Text(widget.type),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Time : "),
                    Text(widget.time),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Length Min : "),
                    Text(widget.lmin),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Length Min : "),
                    Text(widget.lmax),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Weight Min : "),
                    Text(widget.wmin),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Weight Max : "),
                    Text(widget.wmax),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Life Span : "),
                    Text(widget.txtlifespan),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Habitat : "),
                    Expanded(child: Text(widget.txthabitat)),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Range : "),
                    Expanded(child: Text(widget.txtgeorange),)
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Id : "),
                    Text(widget.aid),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}