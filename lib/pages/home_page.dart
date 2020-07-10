import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var items = [
  {
    "icon": "assets/images/battery.svg",
    "title": [
      {"main": "Battery", "sub": "Long life time"}
    ]
  },
  {
    "icon": "assets/images/calendar.svg",
    "title": [
      {"main": "Calendar", "sub": "Find your day"}
    ]
  },
  {
    "icon": "assets/images/notification.svg",
    "title": [
      {"main": "Notification", "sub": "Alam your remember"}
    ]
  },
  {
    "icon": "assets/images/database.svg",
    "title": [
      {"main": "Database", "sub": "Hold your data"}
    ]
  },
  {
    "icon": "assets/images/study.svg",
    "title": [
      {"main": "Study", "sub": "Give you knowledge"}
    ]
  },
  {
    "icon": "assets/images/email.svg",
    "title": [
      {"main": "Email", "sub": "Send you the info"}
    ]
  }
];

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SOME",
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff)),
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          decorationThickness: 1.2,
                          decorationStyle: TextDecorationStyle.solid,
                          color: Color(0xffffffff)),
                    ),
                    Container(
                      height: 3,
                      width: 120,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: SvgPicture.asset(
                    "assets/images/menu.svg",
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.count(
                  primary: false,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: screenSize.width < 500 ? 2 : 3,
                  childAspectRatio: 1 / 1.1,
                  children: [
                    ...(items).map((e) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(e["title"]),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xff5E5E73),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              SvgPicture.asset(
                                e["icon"],
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              ...(e["title"] as List<Map<String, String>>)
                                  .map((title) {
                                return Column(
                                  children: [
                                    Text(
                                      title["main"],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      title["sub"],
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    }).toList()
                  ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF3F3F55),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Study'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            title: Text('Contact'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[500],
        unselectedItemColor: Color.fromRGBO(250, 250, 250, .5),
        onTap: _onItemTapped,
      ),
    );
  }
}
