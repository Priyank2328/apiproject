import 'dart:convert';
import 'package:apiproject/Models/Products.dart';
import 'package:apiproject/ViewProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  var updateid="";
  UpdateProduct({this.updateid});
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _title = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  getsingledata() async
  {
    Uri url = Uri.parse("http://picsyapps.com/studentapi/getSingleProduct.php");
    Map<String,String> params = {
      "pid":widget.updateid
    };
    var response = await http.post(url,body: params);
    if(response.statusCode==200)
    {
      var json = jsonDecode(response.body);
      Products obj = Products.fromJson(json["data"]);
      setState((){
        _title.text = obj.pname.toString();
        _qty.text = obj.qty.toString();
        _price.text = obj.price.toString();
      });
      // setState((){
      //   _name.text = json["data"]["pname"].toString();
      //   _qty.text = json["data"]["qty"].toString();
      //   _price.text = json["data"]["price"].toString();
      // });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsingledata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Title"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _title,
                cursorColor: Colors.green,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _qty,
                cursorColor: Colors.green,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
              child: Text("Price"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _price,
                cursorColor: Colors.green,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
              child: Container(
                child: GestureDetector(
                  onTap: () async{
                    var title = _title.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();

                    Uri url = Uri.parse("http://picsyapps.com/studentapi/updateProductNormal.php");
                    Map<String,String> params = {
                      "pname":title,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updateid,
                    };
                    var response = await http.post(url,body: params);
                    if(response.statusCode==200) {
                      var json = jsonDecode(response.body);
                      if(json["status"]=="true")
                      {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>ViewProduct())
                        );
                      }
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        border: Border.all(width: 3,color: Colors.black),
                      ),
                      child: Text("Submit",style: TextStyle(fontSize: 20.0,color: Colors.black),)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
