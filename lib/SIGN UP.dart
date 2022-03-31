import 'dart:io';

// import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/HOME.dart';
import 'package:salmagrad/PAGE.dart';
import 'package:salmagrad/LOGIN.dart';
import 'package:salmagrad/SIGN%20UP.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
//   uploadImage()async{
//   // String fileName = basename(_image.path);
//    final ref= FirebaseStorage.instance.ref().child('user_image').child('/folderName/$_image');
//    await ref.putFile(_image);
//
//
//
//
// var url = await ref.getDownloadURL();
//    print("//////////////////////////////////////////////////////////////////////////url:$url");
//   }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////try upload code
  var _firebase = Firestore.instance;
  var docId;
  String username, pass, email, gender, birthday;
  List<dynamic> savedRecipes = [
    Column(
      children: [],
    ),
  ];

  bool spinner = false;
  final _auth = FirebaseAuth.instance;
  bool passwordvisibility = true;
  DateTime _dateTime = DateTime.now();
  DateTime _selecteddate;
  Color _color = Colors.white;
  Color _color1 = Colors.white;
  var g = Colors.black54;
  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image selected');
      }
    });
  }

  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: spinner,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/1.jpeg"),
                // fit: BoxFit.cover
                alignment: Alignment.topCenter,
              )),
            ),
            ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 380,
                        height: 800,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(52),
                                topLeft: Radius.circular(52)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Center(
                                  child: Text('Create Account',
                                      style: TextStyle(
                                        color: Color(0xffBC1017),
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'ARIBLP.ttf',
                                      ))),
                              // SizedBox(
                              //   height: 150,
                              // ),
                              imageProfile(),

                              Container(
                                  height: 50,
                                  width: 500,
                                  margin: EdgeInsets.all(8),
                                  child: TextField(
                                      onChanged: (value) {
                                        username = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Color(0xff707070),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffBC1017),
                                          fontFamily: 'ARIBLP.ttf'),
                                      // maxLength: 8,
                                      decoration: InputDecoration(
                                        labelText: "Username",
                                        labelStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff707070),
                                          fontFamily: 'ARIBLP.ttf',
                                        ),
                                        suffix: Icon(
                                          Icons.person,
                                          color: Color(0xff707070),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide(
                                              width: 0.5,
                                              color: Color(0xff707070),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ))),
                              /////////////////////////////////////////////////////////////////////////
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff707070),
                                      fontFamily: 'ARIBLP.ttf',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _color1 == Color(0xff707070)
                                            ? _color1 = Colors.white
                                            : _color1 = Color(0xff707070);
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _color1,
                                      child: Icon(
                                        Icons.tag_faces,
                                        color: Color(0xffBC1017),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Male',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff707070),
                                        fontFamily: 'ARIBLP.ttf',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _color == Color(0xff707070)
                                            ? _color = Colors.white
                                            : _color = Color(0xff707070);
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: _color,
                                      child: Icon(
                                        Icons.face,
                                        color: Color(0xffBC1017),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Female',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff707070),
                                        fontFamily: 'ARIBLP.ttf',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    'Birthday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff707070),
                                      fontFamily: 'ARIBLP.ttf',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff707070),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        height: 50,
                                        width: 205,
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(_dateTime == null
                                              ? 'DD/MM/YYYY'
                                              : _dateTime.toString()),
                                        )),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              builder: (context, child) => Theme(
                                                  data: ThemeData().copyWith(
                                                      colorScheme:
                                                          ColorScheme.dark(
                                                              primary: Color(
                                                                  0xffBC1017),
                                                              surface: Color(
                                                                  0xffBC1017),
                                                              onPrimary:
                                                                  Colors.white),
                                                      dialogBackgroundColor:
                                                          Colors.black54),
                                                  child: child),
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050))
                                          .then((value) => {
                                                if (value != null)
                                                  {
                                                    setState(() {
                                                      print(_dateTime);
                                                      _dateTime = value;
                                                    })
                                                  }
                                              });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 500,
                                  margin: EdgeInsets.all(8),
                                  child: TextField(
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Color(0xff707070),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffBC1017),
                                          fontFamily: 'ARIBLP.ttf'),
                                      // maxLength: 8,
                                      decoration: InputDecoration(
                                        labelText: "Email Account",
                                        labelStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff707070),
                                          fontFamily: 'ARIBLP.ttf',
                                        ),
                                        suffix: Icon(
                                          Icons.alternate_email,
                                          color: Color(0xff707070),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide(
                                              width: 0.5,
                                              color: Color(0xff707070),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),

                                          // hintText: "Enter the Email ",
                                          // hintStyle: TextStyle(
                                          //   fontSize: 20,
                                          //   color: Color(0xff707070),
                                          //   fontFamily: 'ARIBLP.ttf',
                                          // ),
                                        ),
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 500,
                                  margin: EdgeInsets.all(8),
                                  child: TextField(
                                      onChanged: (value) {
                                        pass = value;
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: passwordvisibility,
                                      cursorColor: Color(0xff707070),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffBC1017),
                                          fontFamily: 'ARIBLP.ttf'),
                                      // maxLength: 8,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff707070),
                                          fontFamily: 'ARIBLP.ttf',
                                        ),
                                        suffixIcon: IconButton(
                                          color: Color(0xff707070),
                                          icon: Icon(
                                            passwordvisibility
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordvisibility =
                                                  !passwordvisibility;
                                            });
                                          },
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide(
                                              width: 0.5,
                                              color: Color(0xff707070),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.all(26.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    final ref = FirebaseStorage.instance
                                        .ref()
                                        .child('user_image')
                                        .child('/folderName/$_image');
                                    await ref.putFile(_image);
                                    final url = await ref.getDownloadURL();
                                    print(
                                        "//////////////////////////////////////////////////////////////////////////url:$url");
                                    print({
                                      'username': username,
                                      'email': email,
                                      'pass': pass,
                                      'birthday': _dateTime,
                                      'gender': gender,
                                      'imageurl': url,
                                    });

                                    await _firebase.collection('Users').add({
                                      'username': username,
                                      'email': email,
                                      'pass': pass,
                                      'birthday': _dateTime,
                                      'gender': gender,
                                      'imageurl': url,
                                      'saved recipes': savedRecipes,
                                    });
                                    // DocumentReference docRef = await _firebase
                                    //     .collection('Ingradients')
                                    //     .add({
                                    //   'username': username,
                                    //   'email': email,
                                    //   'pass': pass,
                                    //   'birthday': _dateTime,
                                    //   'gender': gender
                                    // });
                                    // docId = docRef.documentID;
                                    if (email == null || pass == null) {
                                      setState(() {
                                        spinner = false;
                                      });
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 3),
                                          content:
                                              Text('Please complete your data'),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        spinner = false;
                                      });
                                      try {
                                        if (pass.length < 6) {
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.brown,
                                              duration: Duration(seconds: 3),
                                              content: Text(
                                                'password must be longer than 5 chars',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          );
                                        } else {
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                                  email: email, password: pass);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Page1(),
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        if (e is PlatformException) {
                                          if (e.code ==
                                              'ERROR_EMAIL_ALREADY_IN_USE') {
                                            setState(() {
                                              email = '';
                                              pass = '';
                                            });
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.yellow,
                                                duration: Duration(seconds: 3),
                                                content: Text(
                                                  'email exists',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            );
                                          }
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.blue,
                                              duration: Duration(seconds: 3),
                                              content: Text(
                                                'enter valid email and valid password',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    }

                                    //---------------------------------
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 60,
                                    child: Center(
                                        child: Text('Sign Up',
                                            style: TextStyle(
                                              color: Color(0xffBC1017),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'ARIBLP.ttf',
                                            ))),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Color(0xff707070)
                                                .withOpacity(0.5))),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('If there is a account, ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'ARIBLP.ttf',
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()),
                                      );
                                    },
                                    child: Text('Login',
                                        style: TextStyle(
                                          color: Color(0xffBC1017),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'ARIBLP.ttf',
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
              radius: 80,
              backgroundImage: _image == null
                  ? NetworkImage(
                      'https://i.pinimg.com/originals/31/a2/c4/31a2c4af0068d16d7f58e71f0628983d.jpg')
                  : FileImage(_image)),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomsheet()));
              },
              child: Icon(
                Icons.camera_alt,
                color: Color(0xffBC1017),
                size: 30,
              ),
            ),
          )
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
            'Choose profile photo',
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
                onPressed: () async {
                  await getImage(ImageSource.gallery);
                },
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
