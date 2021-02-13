import 'package:flutter/material.dart';
import 'package:test_job/pages/searchpage.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [];

  onItemChanged(String value) {
    setState(() {
      for (var i = 0; i < userFirendsData.length; i++) {
        for (var j = 0; j < i; j++) {
          mainDataList.add(userFirendsData[i][j]['user_name']);
          mainDataList
              .where((string) =>
                  string.toLowerCase().contains(value.toLowerCase()))
              .toList();
          userFirendsData.clear();
          userFirendsData.add(userFirendsData[i][j]);
        }
      }
    });
  }

  bool isadded;

  List<Map<String, dynamic>> userFirendsData = [
    {
      "avatar_image": "assets/female.jpg",
      "user_name": "Mia Reynolds",
      "isadded": true,
    },
    {
      "avatar_image": "assets/female.jpg",
      "user_name": "Loredana Crisan",
      "isadded": true,
    },
    {
      "avatar_image": "assets/male.jpg",
      "user_name": "Brendan Aronoff",
      "isadded": false,
    },
    {
      "avatar_image": "assets/male.jpg",
      "user_name": "Alex Ristevski",
      "isadded": false,
    },
    {
      "avatar_image": "assets/male.jpg",
      "user_name": "Justin Smith",
      "isadded": false,
    },
    {
      "avatar_image": "assets/female.jpg",
      "user_name": "Juliana Liang",
      "isadded": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _appBar(),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1),
                      ),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Search participants',
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                        onChanged: onItemChanged,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(12.0),
                      children: userFirendsData.map<Widget>((friendItem) {
                        return _friendItem(friendItem);
                        // onTap: ()=> print(friendItem),);
                      }).toList(),
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
                onPressed: (){
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
                  ),
                ],
              ),
            )));
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
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Step 2",
                        style: TextStyle(
                          color: Colors.white,
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
                        color: Colors.blue.shade100,
                      ),
                      child: Text(
                        "Step 4",
                        style: TextStyle(
                          color: Colors.blue.shade500,
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
}

Widget _friendItem(Map<String, dynamic> friendData) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
    // width: MediaQuery.of(context).size.width,

    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          width: 55,
          height: 52,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        friendData['avatar_image'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              friendData['user_name'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(children:[
              Text('Participant'),
              Icon(Icons.expand_more),
            ])
          ],
        ),
        Spacer(),
        friendData['isadded']
            ? Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: GestureDetector(
                  onTap: () {
                    friendData['isadded'] = !friendData['isadded'];

                    print(friendData['isadded']);
                  },
                  child: Icon(
                    Icons.check_sharp,
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: GestureDetector(
                  onTap: () {
                    friendData['isadded'] = !friendData['isadded'];
                  },
                  child: Text("Add"),
                ),
              ),
      ],
    ),
  );
}
