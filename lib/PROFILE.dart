import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:salmagrad/ADD.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/My%20Recipes.dart';
import 'package:salmagrad/PROFILE.dart';
import 'package:salmagrad/RECIPE.dart';
import 'package:salmagrad/SEARCH.dart';
import 'package:salmagrad/Saved%20Recipe.dart';
import 'package:salmagrad/main.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:salmagrad/SIGN UP.dart';

class Profile extends StatefulWidget {
  Profile({
    this.username,
    this.email,
  });

  final String username;
  final String email;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _firebase = Firestore.instance;
  var initialIndex = 0;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String username;
  String email;

  String id;
  String imageurl;
  var savedRecipes = <Recipe>[];
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> getCurrentUser() async {
    final FirebaseUser user = await auth.currentUser();
    id = user.uid.toString();
    username = user.displayName.toString();
    email = user.email.toString();

    print('username = $username  ... id = $id  ... email = $email');

    // here you write the codes to input the data into firestore
  }

  Future<void> getSavedRecipes() async {
    var recipesIds = (await Firestore.instance
            .collection('Saves')
            .where('userID', isEqualTo: this.id)
            .getDocuments())
        .documents
        .map((doc) => doc.data['recipeID']);

    savedRecipes = [];
    for (var recipeId in recipesIds) {
      savedRecipes.add(new Recipe.FS(await Firestore.instance
          .collection('Recipes')
          .document(recipeId)
          .get()));
    }
  }

  Future<void> loadData() async {
    await getCurrentUser();
    await getSavedRecipes();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebase.collection('/Users/').snapshots(),
        builder: (context, message) {
          if (!message.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var data = message.data.documents;
          _firebase.collection("Users").getDocuments().then((querySnapshot) {
            querySnapshot.documents.forEach((doc) {
              var id = doc.documentID;
              if (doc.data['email'] == email) {
                username = doc.data['username'];
                imageurl = doc.data['imageurl'];
                print(username);

                // randomly generated document ID
                var data = doc.data;
              }

              // key-value pairs from the document
            });
            setState(() {
              // print('////////////////////////////// image = $imageurl');
            });
          });
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 170,
                      width: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      elevation: 30,
                      child: (imageurl == null)
                          ? CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.black12,
                              backgroundImage: AssetImage('assets/1.jpeg'),
                            )
                          : CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.black12,
                              backgroundImage: NetworkImage(imageurl),
                            ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(username,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'ARIBLP.ttf',
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(email,
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'ARIBLP.ttf',
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Intro()),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                // ToggleSwitch(
                //   cornerRadius: 8.0,
                //   // minWidth:
                //   // (MediaQuery.of(context).size.width - 52) /
                //   //     2,
                //   initialLabelIndex: 0,
                //   // activeBgColor: BlueNewAccentColor,
                //   activeFgColor: Colors.white,
                //   // inactiveBgColor: BlueCardColor,
                //   // inactiveFgColor: BlueAccentColor,
                //   labels: ['Saved Recipe', 'My Recipe'],
                //   fontSize: 16.0,
                //   onToggle: (index) {
                //     setState(() {
                //       // summaryIndex = index;
                //     });
                //   },
                // ),
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                ToggleSwitch(
                    initialLabelIndex: initialIndex,
                    borderColor: [Color(0xff464545)],
                    borderWidth: 1,
                    minWidth: 150.0,
                    minHeight: 50.0,
                    fontSize: 16.0,
                    cornerRadius: 20.0,
                    animate: true,
                    activeBgColor: [Color(0xffBC1017)],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Color(0xffBC1017),
                    totalSwitches: 2,
                    labels: ['Saved Recipes', 'My Recipes'],
                    onToggle: (index) {
                      print('switched index: $index');

                      setState(() {
                        initialIndex = index;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                (initialIndex == 0)
                    ? Saved_recipes(savedRecipes: this.savedRecipes)
                    : My_recipes(),
              ],
            ),
          );
        },
      ),
    );
  }
}
