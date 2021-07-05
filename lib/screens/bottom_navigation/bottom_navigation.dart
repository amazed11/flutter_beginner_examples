import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/text/text_widget_screen.dart';

class DisplayBottomNavigationBar extends StatefulWidget {
  const DisplayBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _DisplayBottomNavigationBarState createState() =>
      _DisplayBottomNavigationBarState();
}

class _DisplayBottomNavigationBarState
    extends State<DisplayBottomNavigationBar> {
//items
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.chat), label: "Chat", tooltip: "Chat"),
    BottomNavigationBarItem(
        icon: Icon(Icons.dashboard), label: "Dashboard", tooltip: "Dashboard"),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: "Profile", tooltip: "Profile"),
  ];

  int currentIndex = 0;
  List<Widget> pages = [
    TextWidgetScreen(),
    Container(
      color: Colors.blue,
      child: Center(child: Text("Chat")),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text("Dashboard")),
    ),
    Container(
      color: Colors.amber,
      child: Center(child: Text("Profile")),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        iconSize: 30.0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (this.mounted) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {},
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
