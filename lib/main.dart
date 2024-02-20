import 'package:flutter/material.dart';
import 'package:navigationdarwer/about.dart';
import 'package:navigationdarwer/calculator.dart';
import 'package:navigationdarwer/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var currentPage = DrawerSections.home;
  String appBarTitle = "Home"; 

  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.home){
      container = WelcomePage();
    }else if(currentPage == DrawerSections.calculator){
      container = Calculator();
    }else if(currentPage == DrawerSections.about){
      container = AboutPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(appBarTitle), // Dynamically set the title
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15,),
      child: Column(
        //shows list of the menu drawer
        children: [
          menuItem(1,"Home", Icons.home_filled, currentPage == DrawerSections.home ? true : false),
          menuItem(2,"Calculator", Icons.calculate_rounded, currentPage == DrawerSections.calculator ? true : false),
          menuItem(3,"About", Icons.adobe_outlined, currentPage == DrawerSections.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title,IconData icon, bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1){
              currentPage = DrawerSections.home;
              appBarTitle = "Home"; // Update title for Home tab
            }else if(id == 2){
              currentPage = DrawerSections.calculator;
              appBarTitle = "Calculator"; // Update title for Calculator tab
            }else if(id == 3){
              currentPage = DrawerSections.about;
              appBarTitle = "About"; // Update title for About tab
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Icon(
                icon, 
                size:20, 
                color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ))
            ],
          ),
          ),
      ),
    );
  }
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
           Text(
            "Welcome", 
            style: TextStyle(color: Colors.white, fontSize: 20,)
          ),
        ],
      ),
    );
  }
}

enum DrawerSections {
  home,
  calculator,
  about,
}
