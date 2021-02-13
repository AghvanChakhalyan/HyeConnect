import 'package:flutter/material.dart';
import 'package:test_job/pages/mypage.dart';
import 'package:test_job/pages/homepage.dart';
import 'package:test_job/pages/searchpage.dart';
import 'package:test_job/pages/setingspage.dart';
import 'package:test_job/pages/notificationpage.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _body() {
    switch (currentIndex) {
      case 0:
      return MyPage();
      break;
      case 1:
       return SearchPage();
       break;
       case 2:
       return  HomePage();
       break;
       case 3:
       return NotificationPage();
       break;
       case 4:
       return SetingsPage();
       break;
       default: 
       return MyPage();
    }
  }

  Widget _bottomBar(){
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.blue,
        elevation: 0,
        onTap: (index){
          setState((){
           currentIndex = index;
          });
        },
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
