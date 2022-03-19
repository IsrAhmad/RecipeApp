import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:salmagrad/ADD.dart';
import 'package:salmagrad/ADVANCED_SEARCH.dart';
import 'package:salmagrad/HOME.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/PROFILE.dart';
import 'package:salmagrad/RECIPE.dart';
import 'package:salmagrad/SEARCH.dart';
import 'package:salmagrad/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page1 extends StatefulWidget {
  Page1({this.username,this.email});
  final username;
  final email;
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int indexValue=0;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white12,
        color: Color(0xffBC1017),
        height: 65,
        buttonBackgroundColor: Color(0xffBC1017),
        items: <Widget>[
          Icon(Icons.home, size: 35),
          Icon(Icons.search, size: 35),
          Icon(Icons.add, size: 35),
          CircleAvatar(
            backgroundImage: AssetImage("assets/5.jpeg"),
            backgroundColor: Colors.white,
          ),
          // Icon(Icons.compare_arrows, size: 35),
        ],
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.fastOutSlowIn,
        index: 0,
        onTap: (index) {
          setState(() {
              indexValue = index;
          });

        },
      ),
      body: (indexValue == 0)?Home():(indexValue == 1)?Advanced():(indexValue == 2)?Add2():
      Profile(username: widget.username,email: widget.email,)
    );
  }
}
