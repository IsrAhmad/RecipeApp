import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:salmagrad/ADD.dart';
// import 'package:salmagrad/KAN%20ADD.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/PROFILE.dart';
import 'package:salmagrad/RECIPE.dart';
import 'package:salmagrad/SEARCH.dart';
// import 'package:salmagrad/dummyy%20code.dart';
import 'package:salmagrad/main.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:searchfield/searchfield.dart';

class Advanced extends StatefulWidget {
  @override
  _AdvancedState createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  List _statesOfmain = ['meat','chicken'];
  List _statesOfsec = [];

  String selectedingredients;
  List mainingredients = [];
  List secingredients = [];
  var _firebase= Firestore.instance;
  var docId;
  String name = '';
  String type = '';
  _buildAreaList() {
    String selectedChoice = "";
    List<Widget> choices = List();
    int i;
    mainingredients.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontFamily: 'SFProDisplay'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Color(0xff222750),
          selectedColor: Colors.transparent,
          // selectedColor: Color(0xffffc107),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              for (int j = 0; j < mainingredients.length; j++) {
                if (mainingredients[j] == item) {
                  i = j;
                  break;
                }
              }
              mainingredients.remove(item);
              print('i = ' + i.toString());
            });
          },
        ),
      ));
    });
    return choices;
  }
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Text(
                        'What is in your fridge?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ARIBLP.ttf',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Enter at least 3 ingredients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'ARIBLP.ttf',
                        ),
                      ),
                    ),
                  ),
                  // Form(
                  //
                  //     child: SearchField(
                  //       suggestions: _statesOfIndia.map((e) =>
                  //           SearchFieldListItem(e)).toList(),
                  //       suggestionState: Suggestion.expand,
                  //       textInputAction: TextInputAction.next,
                  //       hint: 'SearchField Example 2',
                  //       hasOverlay: false,
                  //       searchStyle: TextStyle(
                  //         fontSize: 18,
                  //         color: Colors.black.withOpacity(0.8),
                  //       ),
                  //       validator: (x) {
                  //       },
                  //       searchInputDecoration: InputDecoration(
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: Colors.black.withOpacity(0.8),
                  //           ),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.red),
                  //         ),
                  //       ),
                  //       maxSuggestionsInViewPort: 6,
                  //       itemHeight: 50,
                  //       onTap: (x) {},
                  //     )
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ]),
                      child: SearchField(
                        controller: _controller,
                        hint: 'Enter main ingredients',
                        searchInputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffBC1017), width: 2),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        hasOverlay: false,
                        itemHeight: 50,
                        maxSuggestionsInViewPort: 6,
                        suggestionsDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suggestionState: Suggestion.hidden,
                        suggestions: _statesOfmain
                            .map((e) => SearchFieldListItem(e))
                            .toList(),
                        onTap: (value) {
                          setState(() {
                            selectedingredients = value.searchKey;
                            print(selectedingredients);
                            mainingredients.add(selectedingredients);
                            print(mainingredients);
                            if( selectedingredients  != null){ Padding(
                              padding: const EdgeInsets.all(10.0),

                            );}
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        children: _buildAreaList(),
                      )),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 40),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 20),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(40),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey.withOpacity(0.2),
                  //               blurRadius: 10,
                  //               offset: Offset(0, 10))
                  //         ]),
                      // child: SearchField(
                      //
                      //   hint: 'Enter secondary ingredients',
                      //   searchInputDecoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.white,
                      //         ),
                      //         borderRadius: BorderRadius.circular(40)),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide:
                      //         BorderSide(color: Color(0xffBC1017), width: 2),
                      //         borderRadius: BorderRadius.circular(40)),
                      //   ),
                      //   itemHeight: 50,
                      //   maxSuggestionsInViewPort: 6,
                      //   suggestionsDecoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   suggestionState: Suggestion.hidden,
                      //   suggestions: _statesOfsec
                      //       .map((e) => SearchFieldListItem(e))
                      //       .toList(),
                      //   onTap: (value) {
                      //     setState(() {
                      //       selectedingredients = value.searchKey;
                      //       print(selectedingredients);
                      //       secingredients.add(selectedingredients);
                      //       print(secingredients);
                      //     });
                      //   },
                      // ),
                  //   ),
                  // ),

                  // FlatButton(
                  //     color: Colors.red,
                  //
                  //     onPressed: () async {
                  //       // await _firebase.collection('users').add({
                  //       //
                  //       //   'name': name,
                  //       //   'address': address,
                  //       //   'phone': phone
                  //       // });
                  //       DocumentReference docRef= await _firebase.collection('Ingradients').add({
                  //         'name': name,
                  //         'type': type,
                  //       });
                  //       docId = docRef.documentID;
                  //
                  // }, child: Text('Post To Firestore'))
              SizedBox(height: 90,),

                  AnimatedButton(onPress: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) =>
                    //     Firecode()));
                  },
                    height: 50,
                    width: 100,
                    text: 'Search',
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    selectedBackgroundColor: Color(0xff9C0000),
                    transitionType: TransitionType.CENTER_ROUNDER,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'ARIBLP.ttf',
                    ),
                    backgroundColor: Color(0xffBC1017),
                    borderColor: Colors.white,
                    borderRadius: 50,
                    borderWidth: 2,
                  ),

                ],
              )
            ],
          ),
        ),]
      ),
    );
  }
}

// Firecode() {
// }
