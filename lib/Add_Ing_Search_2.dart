import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/recipe_card.dart';

import 'RECIPE.dart';



class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const historyLength = 5;

  CollectionReference _firebaseFirestore =
  Firestore.instance.collection("Ingredient");
  var docId;
  String Ing;
  bool spinner = false;

  List<String> _searchHistory = [];

  List<String> filteredSearchHistory;

  String selectedTerm;

  get _firebase => null;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  // String name;
  // String image;
  // String cooktime, preptime, steps, destination_link;
  // var category;
  var ingredients;

  // List<RecipeCard> dataList = [];
  getAllRecipesISA() async {
    setState(() {
      // dataList.clear();
    });

    await for (var snapshot in _firebase.collection('Ingredient/').snapshots()) {
      for (var message in snapshot.documents) {
        setState(() {

          ingredients = message.data['ingredients'];

          var height;
          var itemData = RecipeCard(
            new Recipe(
              ingredients: ingredients.toString(),
            ),
            height,
          );
          // dataList.add(itemData);
          _searchHistory.add(ingredients);
          print(message.IngredientID);
        });
      }
    }
  }

  List<RecipeCard> displayCards = List();

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
    getAllRecipesISA();
  }

  _getCardForSearch(String name) {
    print('selected name = $name');
    displayCards.clear();

    // dataList.forEach((element) {
    //   if (element.recipe.name.toString().contains(name)) {
    //     setState(() {
    //       displayCards.add(element);
    //     });
    //   }
    // });
    //   print(displayCards);
    //   print(dataList);
    //   dataList.forEach((element) {
    //     print(element.recipe.name);
    //   });
    // }

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    var _firebase = Firestore.instance;
    @override
    Widget build(BuildContext context) {
      String name;
      String duration;

      return Scaffold(
          body: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 20,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55),
                  child: Container(
                      height: 35,
                      margin: EdgeInsets.all(8),
                      child: TextField(
                          onChanged: (value) {
                            _getCardForSearch(value);
                          },
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xffBC1017),
                          textAlign: TextAlign.center,
                          showCursor: false,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffBC1017),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          ),
                          // maxLength: 8,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add Ing",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xffBC1017),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'ARIBLP.ttf',
                            ),

                            // suffix: Icon(
                            //   Icons.search,
                            //   color: Colors.red,
                            // ),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius:
                            //     BorderRadius.circular(30.0),
                            //     borderSide: BorderSide(
                            //       width: 0.5,
                            //       color: Colors.transparent
                            //     )),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: Colors.red,
                            //   ),
                            //   borderRadius:
                            //   BorderRadius.circular(20.0),
                            //
                            //
                            // ),
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              for (var card in displayCards) card
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
