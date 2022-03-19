import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salmagrad/HOME.dart';
import 'package:salmagrad/PAGE.dart';
import 'package:salmagrad/SIGN%20UP.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool passwordvisibility = true;
  String email;
  String pass;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Builder(
          builder: (context)=>ModalProgressHUD(
            inAsyncCall: spinner,
            child:  Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/1.jpeg"),
                        // fit: BoxFit.cover
                        alignment: Alignment.topCenter,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 380,
                      height: 400,
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
                                child: Text('Welcome',
                                    style: TextStyle(
                                      color: Color(0xffBC1017),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ARIBLP.ttf',
                                    ))),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 50,
                                width: 500,
                                margin: EdgeInsets.all(8),
                                child: TextField(
                                    onChanged: (value) {
                                      email = value;
                                      print(email);
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
                                          borderRadius: BorderRadius.circular(16.0),
                                          borderSide: BorderSide(
                                            width: 0.5,
                                            color: Color(0xff707070),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),

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
                                      print(pass);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
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
                                            passwordvisibility = !passwordvisibility;
                                          });
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16.0),
                                          borderSide: BorderSide(
                                            width: 0.5,
                                            color: Color(0xff707070),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (email == null || pass == null) {
                                    setState(() {
                                      spinner = false;
                                    });
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3),
                                        content: Text('Please enter your email and password'),
                                      ),
                                    );
                                  }
                                  setState(() {
                                    spinner = true;
                                  });
                                  try {
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: pass);
                                    setState(() {
                                      spinner = false;

                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Page1()),
                                    );
                                    //  if(email==null&&pass==null){
                                    //   print('yes');
                                    //   // Scaffold.of(context).showSnackBar(SnackBar(
                                    //   //   content: Text('Please enter email and password'),
                                    //   //   backgroundColor: Colors.red,
                                    //   //   duration: Duration(milliseconds: 1000),
                                    //   // ))
                                    //   ;
                                    // }
                                  } catch (e) {
                                    if(e is PlatformException){
                                      if(e.code == 'ERROR_USER_NOT_FOUND'){
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text('Email Not Found !!'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(milliseconds: 1000),
                                        ));
                                      }else if(e.code == 'ERROR_WRONG_PASSWORD')
                                        {
                                          Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text('Worng Password'),
                                            backgroundColor: Colors.red,
                                          ));
                                        }

                                      // else if(email==null&&pass==null){
                                      //   print('yes');
                                      //   // Scaffold.of(context).showSnackBar(SnackBar(
                                      //   //   content: Text('Please enter email and password'),
                                      //   //   backgroundColor: Colors.red,
                                      //   //   duration: Duration(milliseconds: 1000),
                                      //   // ))
                                      //   ;
                                      // }
                                      setState(() {
                                        spinner = false;
                                      });

                                    }

                                  }

                                },
                                child: Container(
                                  width: 140,
                                  height: 60,
                                  child: Center(
                                      child: Text('Login',
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
                                          color: Color(0xff707070).withOpacity(0.5))),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('If there is no account,',
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
                                      MaterialPageRoute(builder: (context) => signup()),
                                    );
                                  },
                                  child: Text(' sign up',
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
                )
              ],
            ),
          ),
        ));
  }
}
