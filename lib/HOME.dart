import 'package:advanced_search/advanced_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:salmagrad/RECIPE.dart';

import 'package:salmagrad/recipe_card.dart';


import 'DataCard.dart';
import 'SEARCH.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool button = false;
  String name;
  String image;
  String cooktime,preptime,steps,destination_link;
  var category ;
  var ingredients;
  List<RecipeCard> dataList=[];
  List<String> searchableList = [];
  // getData()async{
  //   CollectionReference Lunch = Firestore.instance.collection('Recipes');
  //   await Lunch.where('category',isEqualTo: 'Lunch').getDocuments().then((value) { value.documents.forEach((element)
  //   {print(element.data
  //   )
  //   ;
  //   });
  //   }
  //   );
  //
  // }
  // getData2()async{
  //   CollectionReference Dinner = Firestore.instance.collection('Recipes');
  //   await Dinner.where('category',isEqualTo: 'Dinner').getDocuments().then((value) { value.documents.forEach((element)
  //   {print(element.data
  //   )
  //   ;
  //   });
  //   }
  //   );
  //
  // }
  // getData3()async{
  //   CollectionReference Breakfast = Firestore.instance.collection('Recipes');
  //   var result = await Breakfast.where('category',arrayContainsAny: ['Breakfast']).getDocuments().then((value) { value.documents.forEach((element)
  //   {
  //     print(element.data);
  //       dataList=[];
  //       name=element.data['name'];
  //       image=element.data['image'];
  //       cooktime=element.data['cooktime'];
  //       preptime=element.data['preptime'];
  //       steps=element.data['steps'];
  //       ingredients=element.data['ingredients'];
  //       destination_link=element.data['destination_link'];
  //       var height;
  //       var itemData = RecipeCard(
  //           height: height,
  //           name: name.toString(),
  //           image: image.toString(),
  //           preptime: preptime.toString(),
  //           steps: steps.toString(),
  //           cooktime: cooktime.toString() ,
  //           ingredients: ingredients.toString(),
  //           destination_link: destination_link.toString(),
  //       );
  //       dataList.add(itemData);
  //
  //   });
  //   }
  //   );
  //   print(result);
  //
  // }
  getAllRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {

          setState(() {
            var height;
            var itemData = RecipeCard(
                new Recipe.FS(message),
              height
            );
            dataList.add(itemData);
            print(message.documentID);
          });


      }
    }
  }


  getBRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('Breakfast'))
          {
            setState(() {

              var height;
              var itemData = RecipeCard(
                new Recipe.FS(message),
                height,
              );
              dataList.add(itemData);
              print(message.documentID);
            });

          }
      }
    }
  }
  getLRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('Lunch'))
          {
            setState(() {

              var height;
              var itemData = RecipeCard(
                new Recipe.FS(message),
                height,
              );
              dataList.add(itemData);
              print(message.documentID);
            });

          }
      }
    }
  }
  getDRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('Dinner'))
          {
            setState(() {



              var height;
              var itemData = RecipeCard(
                new Recipe.FS(message),
                height,
              );
              dataList.add(itemData);
              print(message.documentID);
            });

          }
      }
    }
  }
  getHRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('HealthyFood'))
          {
            setState(() {

              name=message.data['name'];
              image=message.data['image'];
              cooktime=message.data['cooktime'];
              preptime=message.data['preptime'];
              steps=message.data['steps'];
              ingredients=message.data['ingredients'];
              destination_link=message.data['destination_link'];
              category=message.data['category'];

              var height;
              var itemData = RecipeCard(
                new Recipe(
                    name: name.toString(),
                    image: image.toString(),
                    preptime: preptime.toString(),
                    steps: steps.toString(),
                    cooktime: cooktime.toString() ,
                    ingredients: ingredients.toString(),
                    destination_link: destination_link.toString(),
                    category: category.toString()
                ),
                height,
              );
              dataList.add(itemData);
              print(message.documentID);
            });

          }
      }
    }
  }
  getDSRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('Dessert'))
          {
            setState(() {


              var height;
              var itemData = RecipeCard(
                new Recipe.FS(message),
                height,
              );
              dataList.add(itemData);
              print(message.documentID);
            });

          }
      }
    }
  }
  getNRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('National'))
        {
          setState(() {


            var height;
            var itemData = RecipeCard(
              new Recipe.FS(message),
              height,
            );
            dataList.add(itemData);
            print(message.documentID);
          });

        }
      }
    }
  }
  getINRecipesISA() async {
    setState(() {
      dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Recipes/').snapshots()) {
      for (var message in snapshot.documents) {
        List categoryList = message.data['category'];
        if(categoryList.contains('International'))
        {
          setState(() {
            var height;
            var itemData = RecipeCard(
              new Recipe.FS(message),
              height,
            );
            dataList.add(itemData);
            print(message.documentID);
          });

        }
      }
    }
  }

  var _firebase= Firestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllRecipesISA();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: (){               Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Search()),
              );},
              child: Material(
                elevation: 20,
                color: Colors.white,
                borderRadius: BorderRadius.circular(55),
                child: Container(alignment: Alignment.center ,
                    height: 35,
                    margin: EdgeInsets.all(8),
                    child: Text('Search for Recipe' ,   style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffBC1017),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'ARIBLP.ttf',
                    ),)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
    //   AdvancedSearch(
    //   data: searchableList,maxElementsToDisplay: 3,
    //     singleItemHeight: 50,
    //     borderColor: Colors.grey,
    //     minLettersForSearch: 0,
    //     selectedTextColor: Color(0xFF3363D9),
    //     fontSize: 14,
    //     borderRadius: 12.0,
    //     hintText: 'Search Me',
    //     cursorColor: Colors.blueGrey,
    //     autoCorrect: false,
    //     focusedBorderColor: Colors.blue,
    //     searchResultsBgColor: Color(0xFAFAFA),
    //     disabledBorderColor: Colors.cyan,
    //     enabledBorderColor: Colors.black,
    //     enabled: true,
    //     caseSensitive: false,
    //     inputTextFieldBgColor: Colors.white10,
    //     clearSearchEnabled: true,
    //     itemsShownAtStart: 10,
    //     searchMode: SearchMode.CONTAINS,
    //     showListOfResults: true,
    //     unSelectedTextColor: Colors.black54,
    //     verticalPadding: 10,
    //     horizontalPadding: 10,
    //     hideHintOnTextInputFocus: true,
    //     hintTextColor: Colors.grey,
    //
    //     onItemTap: (index, value) {     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Recipe()));
    //     print("selected item index is $index");
    //     },
    //   onSearchClear: () {
    //     print("Cleared Search");
    //   },
    //
    //
    // ),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                width: 5,
              ),
                GestureDetector(
                  onTap: (){    getAllRecipesISA();},
                  child: Container(
                    width: 50,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){    getBRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('Breakfast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){   getLRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('Lunch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){ getDRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('Dinner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){ getHRecipesISA();},
                  child: Container(
                    width: 100,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('Healthy Food',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){ getDSRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('Dessert',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),           SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (){ getNRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('National',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),          SizedBox(
                  width: 5,
                ), GestureDetector(
                  onTap: (){ getINRecipesISA();},
                  child: Container(
                    width: 80,
                    height: 37
                    ,
                    decoration: BoxDecoration(
                      color: Color(0xffBC1017),
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: Center(
                      child: Text('International',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Row(
          //       children: [
          //         SizedBox(
          //           width: 10,
          //         ),
          //         GestureDetector(
          //           onTap: (){
          //
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Recipe()),
          //             );
          //           },
          //           child:
          //           FlipCard(
          //             direction: FlipDirection.HORIZONTAL,
          //             key: cardKey,
          //             flipOnTouch: false,
          //             front: Stack(
          //               children: [
          //                 Container(
          //                   width: 165,
          //                   height: 220,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/8.jpeg'),
          //                           fit: BoxFit.cover),
          //                       borderRadius: BorderRadius.circular(20),
          //                       border: Border.all(
          //                           color: Color(0xff707070).withOpacity(0.5))),
          //                 ),
          //                 Positioned(
          //                   bottom: 1,
          //                   right: 0,
          //                   child: FlatButton(
          //                       onPressed: () {
          //                         cardKey.currentState.toggleCard();
          //                       },
          //                       child: Icon(Icons.menu)),
          //                 ),
          //               ],
          //             ),
          //             back: Stack(
          //               children: [
          //                 Container(
          //                   width: 165,
          //                   height: 220,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/8.jpeg'),
          //                           fit: BoxFit.cover),
          //                       borderRadius: BorderRadius.circular(20),
          //                       border: Border.all(
          //                           color: Color(0xff707070).withOpacity(0.5))),
          //                 ),
          //                 Positioned(
          //                   bottom: 1,
          //                   right: 0,
          //                   child: FlatButton(
          //                       onPressed: () {
          //                         cardKey.currentState.toggleCard();
          //                       },
          //                       child: Icon(Icons.menu)),
          //                 ),
          //               ],
          //             ),
          //             // Positioned(
          //             //   bottom: 1,
          //             //   right: 1,
          //             //   child: Container(
          //             //     width: 165,
          //             //     height: 45,
          //             //     decoration: BoxDecoration(
          //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //             //         color: Colors.black54),
          //             //     // padding: EdgeInsets.all(8),
          //             //     child: Center(
          //             //       child: Text(
          //             //         'Strawberry Cheesecake',
          //             //         style: TextStyle(
          //             //           color: Colors.white,
          //             //           fontSize: 14,
          //             //         ),
          //             //         // softWrap: true,
          //             //         // overflow: TextOverflow.fade,
          //             //       ),
          //             //     ),
          //             //   ),
          //             // ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 6,
          //         ),
          //
          //         GestureDetector(
          //           onTap: (){
          //
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Recipe()),
          //             );
          //           },
          //           child:
          //           FlipCard(
          //             direction: FlipDirection.HORIZONTAL,
          //             key: cardKey,
          //             flipOnTouch: false,
          //             front: Stack(
          //               children: [
          //                 Container(
          //                   width: 165,
          //                   height: 220,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/8.jpeg'),
          //                           fit: BoxFit.cover),
          //                       borderRadius: BorderRadius.circular(20),
          //                       border: Border.all(
          //                           color: Color(0xff707070).withOpacity(0.5))),
          //                 ),
          //                 Positioned(
          //                   bottom: 1,
          //                   right: 0,
          //                   child: FlatButton(
          //                       onPressed: () {
          //                         cardKey.currentState.toggleCard();
          //                       },
          //                       child: Icon(Icons.menu)),
          //                 ),
          //               ],
          //             ),
          //             back: Stack(
          //               children: [
          //                 Container(
          //                   width: 165,
          //                   height: 220,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage('assets/8.jpeg'),
          //                           fit: BoxFit.cover),
          //                       borderRadius: BorderRadius.circular(20),
          //                       border: Border.all(
          //                           color: Color(0xff707070).withOpacity(0.5))),
          //                 ),
          //                 Positioned(
          //                   bottom: 1,
          //                   right: 0,
          //                   child: FlatButton(
          //                       onPressed: () {
          //                         cardKey.currentState.toggleCard();
          //                       },
          //                       child: Icon(Icons.menu)),
          //                 ),
          //               ],
          //             ),
          //             // Positioned(
          //             //   bottom: 1,
          //             //   right: 1,
          //             //   child: Container(
          //             //     width: 165,
          //             //     height: 45,
          //             //     decoration: BoxDecoration(
          //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //             //         color: Colors.black54),
          //             //     // padding: EdgeInsets.all(8),
          //             //     child: Center(
          //             //       child: Text(
          //             //         'Strawberry Cheesecake',
          //             //         style: TextStyle(
          //             //           color: Colors.white,
          //             //           fontSize: 14,
          //             //         ),
          //             //         // softWrap: true,
          //             //         // overflow: TextOverflow.fade,
          //             //       ),
          //             //     ),
          //             //   ),
          //             // ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Column(
                children: [
                  for(var object in dataList)
                    object,




                ],
              ),



            ],
          )



          // ,for(var message in dataList)
          //   message,
        ],
      )
    );
  }
}

