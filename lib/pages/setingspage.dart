import 'package:flutter/material.dart';

import 'homepage.dart';

class SetingsPage extends StatefulWidget {
  @override
  _SetingsPageState createState() => _SetingsPageState();
}

class _SetingsPageState extends State<SetingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        margin: EdgeInsets.all(1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                child: Icon(Icons.link),
              ),
              Container(
                margin: EdgeInsets.all(2),
                child: Text("HyeConnect"),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade100,
                ),
                child: GestureDetector(
                  onTap: () {
                    print("see");
                  },
                  child: Icon(
                    Icons.sms,
                    color: Colors.blue,
                    size: 15,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    print("create");
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text("Create Project"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                      ),
                      child: Text(
                        "Step 1",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                    Text("Information"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                      ),
                      child: Text(
                        "Step 2",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                    Text("People"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                      ),
                      child: Text(
                        "Step 3",
                        style: TextStyle(
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                    Text("Resources"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Step 4",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("Preferenc"),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Permissions"),
        Text("Creator"),
        Container(
          child: Row(
            children: [
              Text("Like x Welike x  likecoment x View x"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlineButton(
                onPressed: null,
                child: Text('Back'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: OutlineButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
