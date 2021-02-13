import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'notificationpage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //date
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

//data
  DateTime currentData = DateTime.now();
  Future<void> _selectData(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentData,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentData)
      setState(() {
        currentData = pickedDate;
      });
  }

  // Default Drop Down Item.
  String dropdownValue = 'Public';

  // To show Selected Item in Text.
  String holder = '';

  List<String> actorsName = [
    'Public',
    'Private',
  ];

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

//upload image
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';

  // Image  variables

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  //File variables
  Future<File> files;
  String statusFile = '';
  String baseFile;
  File tmpfile;

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  //chooseFile

  chooseFile() {
    setState(() {
      files = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }
//nextpage function

  nextPage() {
    setState(() {
      print("kliked");
      _body();
    });
  }

//upload function
  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile && null == tmpfile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    String fileNames = tmpfile.path.split('/').last;
    upload(fileName, fileNames);
  }

  upload(String fileName, String fileNames) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
      "selectvalue": dropdownValue,
      "projectName": myController,
      "description": description,
      "data": currentDate,
      "file": baseFile,
      "filename": fileNames,
      "startdata": startData,
      "milestonename": milestonename,
      "seconddata": currentData,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'Add cover photo',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  Widget showFile() {
    return FutureBuilder<File>(
      future: files,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpfile = snapshot.data;
          baseFile = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'Attach media',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  // get  text

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

    super.dispose();
  }

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
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Step 1",
                        style: TextStyle(
                          color: Colors.white,
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
                          color : Colors.blue.shade500,
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

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(child: _stepOne()),
          ],
        ),
      ),
    );
  }

  Widget _stepOne() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        Container(
          // padding: EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("General  information"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RawMaterialButton(
                        clipBehavior: Clip.none,

                        onPressed: chooseImage,
                        // child: Text('Choose Image'),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 15.0,
                        ),
                        padding: EdgeInsets.all(5.0),
                        shape: CircleBorder(),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      showImage(),
                      SizedBox(
                        height: 3.0,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      items: actorsName
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
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
                        hintText: 'Project name',
                      ),
                      controller: myController,
                    ),
                  ),
                ],
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
                    hintText: 'Project name',
                  ),
                  controller: description,
                ),
              ),

              //add file

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RawMaterialButton(
                    clipBehavior: Clip.none,

                    onPressed: chooseFile,
                    // child: Text('Choose Image'),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.attach_file,
                      size: 15.0,
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  showFile(),
                  SizedBox(
                    height: 3.0,
                  ),
                ],
              ),
              //data

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(currentDate.toString()),
                  RawMaterialButton(
                    clipBehavior: Clip.none,
                    onPressed: () => _selectDate(context),
                    child: Icon(Icons.calendar_today),
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                width: 80,
                height: 30,
                child: TextFormField(
                  autocorrect: true,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'start data',
                  ),
                  controller: startData,
                ),
              ),

              Row(
                children: [
                  Text("Milestones"),
                  Icon(
                    Icons.info,
                    color: Colors.blue,
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                width: 80,
                height: 30,
                child: TextFormField(
                  autocorrect: true,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Type milestone name',
                  ),
                  controller: milestonename,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(currentDate.toString()),
                  RawMaterialButton(
                    clipBehavior: Clip.none,
                    onPressed: () => _selectData(context),
                    child: Icon(Icons.calendar_today),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FloatingActionButton(
                      onPressed: null,
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),

              //upload button

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlineButton(
                    onPressed: nextPage,
                    child: Text('Back'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: OutlineButton(
                      onPressed: startUpload,
                      child: Text('Next'),
                    ),
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
