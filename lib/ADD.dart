import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/Add_Ing_Search_2.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
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

import 'Add_Ingredients_Search.dart';

class Add2 extends StatefulWidget {
  @override
  _Add2State createState() => _Add2State();
}

// class RecipeImage extends StatefulWidget {
//   const RecipeImage({Key key}) : super(key: key);
//
//   @override
//   _RecipeImageState createState() => _RecipeImageState();
// }
//
// class _RecipeImageState extends State<RecipeImage> {
//   File _pickedImage;
//   final ImagePicker _picker = ImagePicker(),
//
//   void _pickedImage(ImageSource src) async{
//     final pickedImageFile = await _picker.getImage(source: src);
//
//     if(pickedImageFile != null){
//       setState(() {
//         _pickedImage = File(pickedImageFile.path)
//       });
//     }else{
//       print("No Image Selected");
//     }
//   }



// }




@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          // backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        SizedBox(height: 10.0,),
        Row(
          children: [
            FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              // onPressed: () => _pickedImage(ImageSource.camera),
              icon: Icon(Icons.photo_camera_outlined),
              label: Text('Add Image\nfrom Camera', textAlign: TextAlign.center),
            ),
            FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              // onPressed: ()=> _pickedImage(ImageSource.gallery),
              icon: Icon(Icons.image_outlined),
              label: Text("Add Image\nfrom Gallery", textAlign: TextAlign.center),
            ),
          ],
        ),
      ],
    ),
  );
}
// }



class _Add2State extends State<Add2> {
  var _firebase = Firestore.instance;
  var docId;
  String name, steps, destination_link;
  String cook, prep;
  bool spinner = false;
  List _statesOfmain = ['chicken', 'butter', 'rice ', 'meat'];
  // List _statesOfsec = ['sugar', 'salt', 'red sauce', 'olive oil'];
  List _statesOfCategory = ['Breakfast', 'Lunch', 'Dinner', 'Healthy Food', 'National', 'International','Dessert'];
  _buildAreaList() {
    String selectedChoice = "";
    List<Widget> choices = List();
    int i;
    category.forEach((item) {
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
          backgroundColor:  Color(0xffBC1017),
          selectedColor: Colors.transparent,
          // selectedColor: Color(0xffffc107),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              for (int j = 0; j < category.length; j++) {
                if (category[j] == item) {
                  i = j;
                  break;
                }
              }
              category.remove(item);
              print('i = ' + i.toString());
            });
          },
        ),
      ));
    });
    return choices;
  }
  String selectedingredients;
  List mainingredients = [];
  // List secingredients = [];
  List category = [];
  String selectedCategory;
  File _image;
  final picker = ImagePicker();
  Future getImage(ImageSource src)async{
    final pickedFile = await picker.getImage(source: src);

    setState(() {
      if (pickedFile !=null){
        _image= File(pickedFile.path);
      }else{print('no image selected');}
    }
    );



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                // AddIng(),
        
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,15.0),
                  child: new TextFormField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffBC1017), width: 2),
                          borderRadius: BorderRadius.circular(40)),
                      labelText: "Recipe Title",
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "This is a required field";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new SearchField(
                // validator: (val) {
                //   if (val.length == 0) {
                //     return "This is a required field";
                //   } else {
                //     return null;
                //   }
                // },
                hint: 'Enter ingredients',
                searchInputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xffBC1017), width: 2),
                      borderRadius: BorderRadius.circular(40)),
                ),
                itemHeight: 50,
                maxSuggestionsInViewPort: 6,
                suggestionsDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                suggestionState: Suggestion.hidden,
                suggestions:
                _statesOfmain.map((e) => SearchFieldListItem(e)).toList(),
                onTap: (value) {
                  setState(() {
                    selectedingredients = value.searchKey;
                    print(selectedingredients);
                    mainingredients.add(selectedingredients);
                    print(mainingredients);
                  });
                },

              ),

              // TextFormField(
              //   decoration: new InputDecoration(
              //     labelText: "Main Ingredients",
              //     fillColor: Colors.white,
              //     border: new OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(25.0),
              //       borderSide: new BorderSide(),
              //     ),
              //   ),
              //   validator: (val) {
              //     if(val.length==0) {
              //       return "This is a required field";
              //     }else{
              //       return null;
              //     }
              //   },
              // ),
            ),
            TextButton( child: Text('Add Ingredient Screen'),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.all(10.0)),
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xffBC1017)),
                  foregroundColor: MaterialStateProperty.all(
                      Colors.white),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ))
              ),
              onPressed: () {     Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddIng()),
              );},
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new SearchField(
                // validator: (val) {
                //   if (val.length == 0) {
                //     return "This is a required field";
                //   } else {
                //     return null;
                //   }
                // },
                hint: 'Enter category',
                searchInputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xffBC1017), width: 2),
                      borderRadius: BorderRadius.circular(40)),
                ),
                itemHeight: 50,
                maxSuggestionsInViewPort: 6,
                suggestionsDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                suggestionState: Suggestion.expand,
                suggestions:
                _statesOfCategory.map((e) => SearchFieldListItem(e)).toList(),
                onTap: (value) {
                  setState(() {
                    selectedCategory = value.searchKey;
                    print(selectedCategory);
                    category.add(selectedCategory);
                    print(category);
                  });
                },//-------------------------------------------------------------------------------------------------------
              ),

            ),

            Container(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: _buildAreaList(),
                )),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10.0 ,width: 30.0)
                ],
              ),
            ),
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            //   child: Row(
            //     children: [
            //       Tooltip(
            //         message: 'Ingredients that are strictly necessary to make the recipe. ex: flour and cheese in a pizza recipe',
            //         verticalOffset: 10.0,
            //         height: 3.0,
            //         child: Text(
            //           'What are main ingredients?',
            //           style: TextStyle(
            //             fontSize: 12.0,
            //             decoration: TextDecoration.underline,
            //             color: Colors.blue,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: new SearchField(
            //     validator: (val) {
            //       if (val.length == 0) {
            //         return "This is a required field";
            //       } else {
            //         return null;
            //       }
            //     },
            //     hint: 'Enter secondary ingredients',
            //     searchInputDecoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(40)),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide:
            //           BorderSide(color: Color(0xffBC1017), width: 2),
            //           borderRadius: BorderRadius.circular(40)),
            //     ),
            //     itemHeight: 50,
            //     maxSuggestionsInViewPort: 6,
            //     suggestionsDecoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     suggestionState: Suggestion.hidden,
            //     suggestions:
            //     _statesOfsec.map((e) => SearchFieldListItem(e)).toList(),
            //     onTap: (value) {
            //       setState(() {
            //         selectedingredients = value.searchKey;
            //         print(selectedingredients);
            //         secingredients.add(selectedingredients);
            //         print(secingredients);
            //       });
            //     },
            //   ),
            //   // TextFormField(
            //   //   decoration: new InputDecoration(
            //   //     labelText: "Secondary ingredients",
            //   //     fillColor: Colors.white,
            //   //     border: new OutlineInputBorder(
            //   //       borderRadius: new BorderRadius.circular(25.0),
            //   //       borderSide: new BorderSide(),
            //   //     ),
            //   //   ),
            //   //   validator: (val) {
            //   //     if (val.length == 0) {
            //   //       return "This is a required field";
            //   //     } else {
            //   //       return null;
            //   //     }
            //   //   },
            //   // ),
            // ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10.0 ,width: 30.0)
                ],
              ),
            ),
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            //   child: Row(
            //     children: [
            //       Tooltip(
            //         message: 'additional ingredients that are not crucial. ex: spices and vegetables in a pizza recipe' ,
            //         verticalOffset: 10.0,
            //         height: 3.0,
            //         child: Text(
            //           'What are secondary ingredients?',
            //           style: TextStyle(
            //             fontSize: 12.0,
            //             decoration: TextDecoration.underline,
            //             color: Colors.blue,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 0.0),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Time (in minutes)',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        //decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                    height: 30.0,
                    width: 120.0,
                    // color: Color(0xffBC1017),
                  ),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    'Prep time',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      //decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  height: 50.0,
                  width: 40.0,
                  // color: Color(0xffBC1017),
                ),
                SizedBox(
                  width: 100, //child: TextField(),
                  child: new TextFormField(
                    onChanged: (value) {
                      prep = value;
                    },
                    decoration: new InputDecoration(
                      hintText: "in minutes",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffBC1017), width: 2),
                          borderRadius: BorderRadius.circular(40)),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Cook time',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      //decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  height: 50.0,
                  width: 40.0,
                  // color: Color(0xffBC1017),
                ),
                SizedBox(
                  width: 100, //child: TextField(),
                  child: new TextFormField(
                    onChanged: (value) {
                      cook = value;
                    },
                    decoration: new InputDecoration(
                      hintText: "in minutes",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffBC1017), width: 2),
                          borderRadius: BorderRadius.circular(40)),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       child: Image(
            //         image: NetworkImage(
            //             'https://i.pinimg.com/originals/31/a2/c4/31a2c4af0068d16d7f58e71f0628983d.jpg'),
            //       ),
            //       height: 360.0,
            //       width: 360.0,
            //       // color: Color(0xffBC1017),
            //     ),
            //   ],
            // ),
            imageProfile(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Steps',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        //decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                    height: 30.0,
                    width: 120.0,
                    // color: Color(0xffBC1017),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200.0,
                child: new TextFormField(
                  onChanged: (value) {
                    steps = value;
                  },
                  expands: true,
                  maxLength: null,
                  decoration: new InputDecoration(
                    hintText: "Put each step in a line ..........",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffBC1017), width: 2),
                        borderRadius: BorderRadius.circular(40)),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  // validator: (val) {
                  //   if (val.length == 0) {
                  //     return "This is a required field";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,15.0),
              child: new TextFormField(
                onChanged: (value) {
                  destination_link = value;
                },
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xffBC1017), width: 2),
                      borderRadius: BorderRadius.circular(40)),
                  hintText: "Add Destination Link (Optional)",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () async {
                      //////////////////////////////////start the upload image
                      final ref= FirebaseStorage.instance.ref().child('user_image').child('/folderName/$_image');
                      await ref.putFile(_image);




                      final url = await ref.getDownloadURL();
                      print("//////////////////////////////////////////////////////////////////////////url:$url");

                      //////////////////////////////////end the upload image
                      print({
                        'name': name,
                        'Ingredients': mainingredients,
                        'preptime': prep,
                        'cooktime': cook,
                        'category' : category,
                        'steps': steps,
                        'image': url,
                        'destination_link': destination_link,
                      });
                      await _firebase.collection('Recipes').add({
                        'name': name,
                        'ingredients': mainingredients,
                        'preptime': prep,
                        'cooktime': cook,
                        'category' : category,
                        'steps': steps,
                        'image': url,
                        'destination_link': destination_link,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page1(),
                        ),
                      );


                      if (name == null  ) {
                        setState(() {
                          spinner = false;
                        });
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 10),
                            content:
                            Text('Please complete your data'),
                          ),
                        );
                      } else {
                        setState(() {
                          spinner = false;
                        });
                      }
                    },
                    child: TextButton( child: Text('Post'),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.all(10.0)),
                          backgroundColor: MaterialStateProperty.all(
                              Color(0xffBC1017)),
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ))
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        //  ),
      ),
    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            child: Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:  _image == null
                        ?
                    NetworkImage('https://i.pinimg.com/originals/31/a2/c4/31a2c4af0068d16d7f58e71f0628983d.jpg')
                        : FileImage(_image),
                    fit: BoxFit.cover
                    ,alignment: Alignment.topLeft,
                  )),
              height: 250,
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(  onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomsheet()));
                },child: IconButton(icon: Icon(Icons.camera_alt,size: 40,))),
              ),
            ),
          ),


          ///////////////////////////////////////////////////////////////////////////
          // CircleAvatar(
          //     radius: 90,
          //     backgroundImage:
          //     _image == null
          //         ?
          //     NetworkImage('https://i.pinimg.com/originals/31/a2/c4/31a2c4af0068d16d7f58e71f0628983d.jpg')
          //         : FileImage(_image)
          // ),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: GestureDetector(
          //     onTap: () {
          //       showModalBottomSheet(
          //           context: context, builder: ((builder) => bottomsheet()));
          //     },
          //     child: Icon(
          //       Icons.camera_alt,
          //       color: Color(0xffBC1017),
          //       size: 30,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
  Widget bottomsheet() {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Recipe photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                onPressed: () {
                  getImage(ImageSource.camera);

                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: (){
                  getImage(ImageSource.gallery);
                }

                ,
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }
}
