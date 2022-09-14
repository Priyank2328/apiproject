import 'package:flutter/material.dart';
class UpdateEmployee extends StatefulWidget {
  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}
class _UpdateEmployeeState extends State<UpdateEmployee> {
  var grpvalue="M";
  var select="e1";
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Salary"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _salary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text("Gender"),
            ),
            Row(
              children: [

                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text("Male"),
                ),
                Radio(
                  value: "M",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
                Text("Female"),
                Radio(
                  value: "F",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: DropdownButton(
                  icon: Icon(Icons.arrow_downward),
                  value: select,
                  onChanged: (val)
                  {
                    setState(() {
                      select = val;
                    });
                  },
                  items:[
                    DropdownMenuItem(
                      child: Text("1"),
                      value: "e1",
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: "e2",
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: "e3",
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: "e4",
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: "e5",
                    ),
                  ]
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async{




                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
