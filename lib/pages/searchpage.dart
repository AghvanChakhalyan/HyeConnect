import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_job/pages/setingspage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  String status = '';
  String base64Image;

  String errMessage = 'Error Uploading Image';

// Default Drop Down Item.
  // String dropdownValue = 'Specification';
  String dropdownValue = 'Specification';

  // To show Selected Item in Text.
  String holder = '';

  List<String> actorsName = [
    'Specification',
    'Private',
  ];

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading data');
    if (null == myController && null == description && null == dropdownValue) {
      setStatus(errMessage);
      return;
    }

    upload();
  }

  upload() {
    http.post(uploadEndPoint, body: {
      "selectvalue": dropdownValue,
      "projectName": myController,
      "description": description,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NotificationPage()),
    // );
  }

  bool available = false;
  bool resursis = false;
  final myController = TextEditingController();
  final description = TextEditingController();
  final startData = TextEditingController();
  final milestonename = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    description.dispose();
    startData.dispose();
    milestonename.dispose();

    super.dispose();
  }

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
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Step 3",
                        style: TextStyle(
                          color: Colors.white,
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

  Widget _body() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    resursis = !resursis;
                  });
                },
                child: Text("Missing resourss")),
            resursis ? Container() : Icon(Icons.add),
          ],
        ),
        resursis ? _stepOne() : Container(),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    available = !available;
                  });
                },
                child: Text("Available resourss")),
            available ? Container() : Icon(Icons.add),
          ],
        ),
        available ? _stepOne() : Container(),
        Row(
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
                    MaterialPageRoute(builder: (context) => SetingsPage()),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _stepOne() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                width: 200,
                height: 30,
                child: TextFormField(
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Intangible goods',
                  ),
                  controller: myController,
                ),
              ),

              Container(
                width: 80,
                margin: EdgeInsets.only(left: 12),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  onChanged: (String data) {
                    setState(() {
                      dropdownValue = data;
                    });
                  },
                  items:
                      actorsName.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              //description

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                width: 80,
                height: 70,
                child: TextFormField(
                  autocorrect: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Additional informaton',
                  ),
                  controller: description,
                ),
              ),

              //upload button

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: OutlineButton(
                      onPressed: startUpload,
                      child: Text('Save'),
                    ),
                  ),
                  OutlineButton(
                    onPressed: null,
                    child: Text('Discard'),
                  ),
                ],
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
