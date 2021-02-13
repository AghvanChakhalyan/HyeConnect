import 'package:flutter/material.dart';

class CreateProjectPage extends StatefulWidget {
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Icon(Icons.link),
            ),
            Container(
              child: Text("HyeConnect"),
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onTap: () {
                  print("see");
                },
                child: Icon(
                   
                  Icons.sms,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              color: Colors.blue,
             child: GestureDetector(
               onTap: (){
                 print("create");
               },
               child: Text(
                 "Create",
                 style: TextStyle(color: Colors.white),
              ),
             ),
            ),
          ],
        )
      ]),
    );
  }
}
