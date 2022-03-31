// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/HOME.dart';
import 'package:salmagrad/PAGE.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/SIGN%20UP.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:searchfield/searchfield.dart';

// import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/HOME.dart';
import 'package:salmagrad/PAGE.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/SIGN%20UP.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:searchfield/searchfield.dart';

// import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class AddIng extends StatefulWidget {
  @override
  _AddIngState createState() => _AddIngState();
}

class _AddIngState extends State<AddIng> {
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

  get _instance => null;

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

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'Enter Ingredients',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Enter Ingredients',
        actions: [
          FloatingSearchBarAction.icon(icon: Icons.add, onTap: () {}),
        ],
        onQueryChanged: (query) async {
          // todo: make request to firestore
          var predictedIngredients = List<String>.from((await Firestore.instance
                  .collection('Ingredient')
                  .orderBy('name')
                  .startAt([query])
                  .endAt([query + '~'])
                  .limit(5)
                  .getDocuments())
              .documents
              .map((doc) => doc.data['name']));
          // todo: add debounce
          setState(() {
            filteredSearchHistory = predictedIngredients;
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 88,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Start adding ingredients',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.bottomRight,
                            child: (new IconButton(
                              icon: new Icon(
                                Icons.add,
                                size: 35,
                              ),
                              highlightColor: Colors.black,
                              onPressed: () {
                                print('You clicked me, glorious Israa >_<');
                              }, //++++++++++++++++++
                            )),
                          ),
                        ],
                      ),
                    );
                  } else if (filteredSearchHistory.length == 0 && controller.query.length >= 0) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(controller.query),
                          leading: const Icon(Icons.add),
                          onTap: () async {
                            await Firestore.instance.collection('Ingredient').add({'name': controller.query});
                            setState(() {
                              addSearchTerm(controller.query);
                              selectedTerm = controller.query;
                            });
                            controller.close();
                          },
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: filteredSearchHistory
                              .map(
                                (term) => ListTile(
                                  title: Text(
                                    term,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // leading: const Icon(Icons.),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        print(
                                            'Add me to the list please Israa ^_^!');
                                      }); ///////////////////////////////////////////////////////////////////////////////////////////////
                                    },
                                  ),
                                  onTap: () {
                                    setState(() {
                                      putSearchTermFirst(term);
                                      selectedTerm = term;
                                    });
                                    controller.close();
                                  },
                                ),
                              )
                              .toList(),
                        ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.bottomRight,
                            child: (new IconButton(
                              icon: new Icon(
                                Icons.add,
                                size: 35,
                              ),
                              highlightColor: Colors.black,
                              onPressed: () {
                                print('You clicked me, glorious Israa >_<');
                              }, //+++++++++++++++++++++++++
                            )),
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 64,
            ),
            Text(
              'Start adding ingredients',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }
    print('$searchTerm');
    // print('$Firestore.$instance.$collection("Ingredient")');

    // _firebaseFirestore.collection('Ingredient').add({
    //   '$searchTerm',
    // });

    final fsb = FloatingSearchBar.of(context);

    return ListView(
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        1,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          // subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
