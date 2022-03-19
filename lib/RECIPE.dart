import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:like_button/like_button.dart';

import 'package:url_launcher/url_launcher.dart';
// import 'package:salmagrad/KAN%20ADD.dart';
import 'package:toggle_switch/toggle_switch.dart';

//////////////////////////////////////////////////////////////////////////////////url launcher



class Like extends StatefulWidget {
  final recipe;
  Like({this.recipe});

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final animationDuration = Duration(milliseconds: 500);
    return SizedBox(
      height: 35,
      width: 70,

      child: LikeButton(
        size: 30,
        isLiked: isLiked,
        likeCount: widget.recipe.likes,
        circleColor: CircleColor(end: Colors.redAccent, start: Colors.red),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xffBC1017),
          dotSecondaryColor: Colors.white,
        ),
        likeCountPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        likeBuilder: (bool isLiked){
          return Icon(
            Icons.favorite,
            color: isLiked? Color(0xffBC1017) : Colors.grey,
            size: 30,
          );
        },//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        onTap: (isLiked) async{
          // likeCount += this.isLiked ? : -1;
          widget.recipe.likes += this.isLiked?  1 :0;

          // Future.delayed(animationDuration).then((_) => setState(() {}));
          if(!isLiked) {
            await Firestore.instance.collection('Recipes').document(widget.recipe.id).updateData({"likes": FieldValue.increment(1)});
          } else {
            await Firestore.instance.collection('Recipes').document(widget.recipe.id).updateData({"likes": FieldValue.increment(-1)});
          }
          isLiked = !isLiked;
          return isLiked;
        },
      ),
    );
  }
}


class BMark extends StatefulWidget {


  @override
  _BMarkState createState() => _BMarkState();
}

class _BMarkState extends State<BMark> {

  bool isLiked = false;
  // int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    final animationDuration = Duration(milliseconds: 500);
    return SizedBox(
      height: 35,
      width: 50,

      child: LikeButton(
        size: 30,
        isLiked: isLiked,
        // likeCount: likeCount,
        circleColor: CircleColor(end: Colors.redAccent, start: Colors.red),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Color(0xffBC1017),
          dotSecondaryColor: Colors.white,
        ),
        likeCountPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        likeBuilder: (bool isLiked){
          return Icon(
            Icons.bookmark,
            color: isLiked? Colors.black : Colors.grey,
            size: 30,
          );
        },
        onTap: (isLiked) async{
          // likeCount += this.isLiked ? 1 : 0;
          // Future.delayed(animationDuration).then((_) => setState(() {}));

          return !isLiked;
        },
      ),
    );
  }
}









class Utils {
  static Future openLink({
    @required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail({
    @required String toEmail,
    @required String subject,
    @required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future openPhoneCall({@required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    await _launchUrl(url);
  }

  static Future openSMS({@required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////url launcher
class Recipe {
  var id;
  var name;
  var cooktime;
  var preptime;
  var image;
  var steps;
  var ingredients;
  var destination_link;
  var category;
  var likes;

  Recipe.FS(document) {
    id=document.documentID;
    name=document.data['name'].toString();
    image=document.data['image'] != null ? document.data['image'].toString() : '';
    cooktime=document.data['cooktime'].toString();
    preptime=document.data['preptime'].toString();
    steps=document.data['steps'].toString();
    ingredients=document.data['ingredients'].toString();
    destination_link=document.data['destination_link'].toString();
    category=document.data['category'].toString();
    likes = document.data['likes'] ?? 0;
  }

  Recipe(
      {
        this.id,
        this.name,
        this.image,
        this.cooktime,
        this.preptime,
        this.steps,
        this.ingredients,
        this.destination_link,
        this.category,
        this.likes
      });
}
class RecipePage extends StatefulWidget {
  final recipe;
  RecipePage({this.recipe});
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  var initialIndex = 0;
  get id => widget.recipe.id;

  void _launchURL() async {
    if (!await launch(widget.recipe.destination_link))
      throw 'Could not launch $widget.destination_link';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 295,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(widget.recipe.image),
          fit: BoxFit.cover,
          // fit: BoxFit.cover
          alignment: Alignment.topCenter,
        )),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Theme(
              data: Theme.of(context).copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(Color(0xffBC1017)),
                ),
              ),
              child: Scrollbar(
                  isAlwaysShown: true,
                  radius: Radius.circular(3.0),
                  child: Container(
                      width: 380,
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(52),
                              topLeft: Radius.circular(52)),
                          color: Colors.white),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(children: [
                              Center(
                                  child: Container(
                                child: Text(widget.recipe.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ARIBLP.ttf',
                                    )),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Like(recipe: widget.recipe),
                                  BMark(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'cook time',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ARIBLP.ttf',
                                    ),
                                  ),    SizedBox(width: 2,),
                                  Icon(
                                    Icons.access_time,
                                    size: 30,
                                    color: Colors.grey,
                                  ),    SizedBox(width: 2,),
                                  Text(widget.recipe.cooktime,
                                      style: TextStyle(
                                        color: Color(0xffBC1017),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'ARIBLP.ttf',
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'prep time',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ARIBLP.ttf',
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(
                                    Icons.access_time,
                                    size: 30,
                                    color: Colors.grey,
                                  ),    SizedBox(width: 8,),
                                  Text(widget.recipe.preptime,
                                      style: TextStyle(
                                        color: Color(0xffBC1017),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'ARIBLP.ttf',
                                      )),
                                ],
                              ),

                              Container(
                                alignment: Alignment.topLeft,
                                child: Text('Nutrition Facts',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ARIBLP.ttf',
                                    )),
                              ),

                              SizedBox(
                                height: 10,
                              ),
/////////////////////////////////////cicular progress

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                      labels: ['Ingredients', 'Steps'],
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
                                      ? SingleChildScrollView(
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                  width: 500,
                                                  height: 300,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Text(
                                                              widget
                                                                  .recipe.ingredients,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontFamily:
                                                                    'ARIBLP.ttf',
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  )


                                                  )))
                                      : SingleChildScrollView(
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                  width: 500,
                                                  height: 300,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            children: [
                                                              Text(widget.recipe.steps,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    fontFamily:
                                                                        'ARIBLP.ttf',
                                                                  )),
                                                              ////////////////////////////////////////////////////////////////////////////////////fi link wala l2
                                                              // (widget.destination_link ==
                                                              //         null)
                                                              //     ? Container(child:Text(
                                                              //     'no link',
                                                              //     style:
                                                              //     TextStyle(
                                                              //       color: Colors
                                                              //           .black,
                                                              //       fontSize:
                                                              //       16,
                                                              //       fontWeight:
                                                              //       FontWeight.bold,
                                                              //       fontStyle:
                                                              //       FontStyle.italic,
                                                              //       fontFamily:
                                                              //       'ARIBLP.ttf',
                                                              //     )),)
                                                              //     :
                                                              ////////////////////////////////////////////////////////////////////////////////////another way for url
                                                              // IconButton(
                                                              //     icon: Icon(
                                                              //       Icons.link,
                                                              //       size: 40,color: Color(0xffBC1017),
                                                              //     ),
                                                              //     onPressed: () =>
                                                              //         Utils.openLink(
                                                              //             url: widget
                                                              //                 .destination_link)),

                                                              ////////////////////////////////////////////////////////////////////////////////////another way for url
                                                              Padding(
                                                                padding: const EdgeInsets.all(30.0),
                                                                child: GestureDetector(
                                                                            onTap: () =>Utils.openLink(url:widget.recipe.destination_link)
                                                                            ,
                                                                                child:(widget.recipe.destination_link != 'null')? Text(
                                                                                 widget.recipe.destination_link,
                                                                                    style:
                                                                                        TextStyle(
                                                                                      color: Color(0xffBC1017),
                                                                                      fontSize:
                                                                                          16,
                                                                                      fontWeight:
                                                                                          FontWeight.bold,
                                                                                      fontStyle:
                                                                                          FontStyle.italic,
                                                                                      fontFamily:
                                                                                          'ARIBLP.ttf',
                                                                                    )):Container(),
                                                                              ),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )

                                                  // Container(
                                                  //     decoration: BoxDecoration(
                                                  //         image: DecorationImage(
                                                  //           image: AssetImage("assets/1.jpeg"),
                                                  //           // fit: BoxFit.cover
                                                  //           alignment: Alignment.topLeft,
                                                  //         )),
                                                  //   ),

                                                  )),
                                        ),

                                ],
                              ),
                              Row(
                                children: [
                                  Text("Category:",
                                      style: TextStyle(
                                        color: Color(0xffBC1017),
                                        fontSize: 19,
                                        fontFamily: 'ARIBLP.ttf',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      )),
                                  Text(
                                    widget.recipe.category,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ARIBLP.ttf',
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.beenhere_outlined,
                                        size: 50,
                                      ))
                                ],
                              )


                            ]),
                          )))))
        ],
      )
    ]));
  }
}
