// // import 'package:flutter/material.dart';
// // import 'package:salmagrad/RECIPE.dart';
// // import 'package:salmagrad/SEARCH.dart';
// // import 'package:flutter_animated_button/flutter_animated_button.dart';
// // import 'package:flip_card/flip_card.dart';
// // import 'package:salmagrad/recipe_card.dart';
// //
// // class Home extends StatefulWidget {
// //   @override
// //   _HomeState createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: ListView(
// //           children: <Widget>[
// //             Row(
// //               children: <Widget>[
// //                 Column(
// //                   children: <Widget>[Container(height: 100.0)],
// //                 ),
// //                 SizedBox(
// //                   width: 30.0,
// //                 ),
// //                 GestureDetector(
// //
// //                   onTap: () {
// //                     Navigator.push(
// //                         context, MaterialPageRoute(builder: (context) => Search()));
// //                   },
// //                   child: Container(
// //                       width: 300.0,
// //                       height: 45.0,
// //                       decoration: BoxDecoration(color: Colors.white, boxShadow: [
// //                         BoxShadow(
// //                             color: Colors.black12,
// //                             offset: Offset(0.0, 5.0),
// //                             blurRadius: 4.0)
// //                       ]),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: <Widget>[
// //                           Flexible(
// //                             child: Container(
// //                               width: 160.0,
// //                               height: 35.0,
// //                               child: Container(
// //                                 padding: EdgeInsets.only(top: 6.0),
// //                                 child: Text('Search...',
// //                                     style: TextStyle(
// //                                         color: Colors.black54,
// //                                         fontWeight: FontWeight.w300)),
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(width: 35.0),
// //                           Icon(
// //                             Icons.search,
// //                             size: 28.0,
// //                           ),
// //                         ],
// //                       )),
// //                 ),
// //                 // Flexible(
// //                 //   child:
// //                 //   Container(
// //                 //     width: 45.0,
// //                 //     height: 45.0,
// //                 //     decoration: BoxDecoration(color: Colors.green, boxShadow: [
// //                 //       BoxShadow(
// //                 //           color: Colors.black12,
// //                 //           offset: Offset(0.0, 5.0),
// //                 //           blurRadius: 4.0)
// //                 //     ]),
// //                 //     child: Icon(
// //                 //       Icons.filter_list,
// //                 //       size: 28.0,
// //                 //     ),
// //                 //   ),
// //                 // )
// //               ],
// //             ),
// //             SingleChildScrollView(
// //               scrollDirection: Axis.horizontal,
// //               child: Row(
// //                 children: [
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   AnimatedButton(
// //                     height: 40,
// //                     width: 80,
// //                     text: 'Breakfast',
// //                     isReverse: true,
// //                     selectedTextColor: Colors.black,
// //                     selectedBackgroundColor: Color(0xff707070),
// //                     transitionType: TransitionType.TOP_CENTER_ROUNDER,
// //                     textStyle: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.bold,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'ARIBLP.ttf',
// //                     ),
// //                     backgroundColor: Color(0xffBC1017),
// //                     borderColor: Colors.white,
// //                     borderRadius: 50,
// //                     borderWidth: 2,
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   AnimatedButton(
// //                     height: 40,
// //                     width: 80,
// //                     text: 'Lunch',
// //                     isReverse: true,
// //                     selectedTextColor: Colors.black,
// //                     selectedBackgroundColor: Color(0xff707070),
// //                     transitionType: TransitionType.TOP_CENTER_ROUNDER,
// //                     textStyle: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.bold,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'ARIBLP.ttf',
// //                     ),
// //                     backgroundColor: Color(0xffBC1017),
// //                     borderColor: Colors.white,
// //                     borderRadius: 50,
// //                     borderWidth: 2,
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   AnimatedButton(
// //                     height: 40,
// //                     width: 80,
// //                     text: 'Dinner',
// //                     isReverse: true,
// //                     selectedTextColor: Colors.black,
// //                     selectedBackgroundColor: Color(0xff707070),
// //                     transitionType: TransitionType.TOP_CENTER_ROUNDER,
// //                     textStyle: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.bold,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'ARIBLP.ttf',
// //                     ),
// //                     backgroundColor: Color(0xffBC1017),
// //                     borderColor: Colors.white,
// //                     borderRadius: 50,
// //                     borderWidth: 2,
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   AnimatedButton(
// //                     height: 40,
// //                     width: 100,
// //                     text: 'Healthy Food',
// //                     isReverse: true,
// //                     selectedTextColor: Colors.black,
// //                     selectedBackgroundColor: Color(0xff707070),
// //                     transitionType: TransitionType.TOP_CENTER_ROUNDER,
// //                     textStyle: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.bold,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'ARIBLP.ttf',
// //                     ),
// //                     backgroundColor: Color(0xffBC1017),
// //                     borderColor: Colors.white,
// //                     borderRadius: 50,
// //                     borderWidth: 2,
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   AnimatedButton(
// //                     height: 40,
// //                     width: 80,
// //                     text: 'Dessert',
// //                     isReverse: true,
// //                     selectedTextColor: Colors.black,
// //                     selectedBackgroundColor: Color(0xff707070),
// //                     transitionType: TransitionType.TOP_CENTER_ROUNDER,
// //                     textStyle: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.bold,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'ARIBLP.ttf',
// //                     ),
// //                     backgroundColor: Color(0xffBC1017),
// //                     borderColor: Colors.white,
// //                     borderRadius: 50,
// //                     borderWidth: 2,
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // Column(
// //             //   children: [
// //             //     SizedBox(
// //             //       height: 10,
// //             //     ),
// //             //     Row(
// //             //       children: [
// //             //         SizedBox(
// //             //           width: 10,
// //             //         ),
// //             //         GestureDetector(
// //             //           onTap: (){
// //             //
// //             //             Navigator.push(
// //             //               context,
// //             //               MaterialPageRoute(builder: (context) => Recipe()),
// //             //             );
// //             //           },
// //             //           child:
// //             //           FlipCard(
// //             //             direction: FlipDirection.HORIZONTAL,
// //             //             key: cardKey,
// //             //             flipOnTouch: false,
// //             //             front: Stack(
// //             //               children: [
// //             //                 Container(
// //             //                   width: 165,
// //             //                   height: 220,
// //             //                   decoration: BoxDecoration(
// //             //                       image: DecorationImage(
// //             //                           image: AssetImage('assets/8.jpeg'),
// //             //                           fit: BoxFit.cover),
// //             //                       borderRadius: BorderRadius.circular(20),
// //             //                       border: Border.all(
// //             //                           color: Color(0xff707070).withOpacity(0.5))),
// //             //                 ),
// //             //                 Positioned(
// //             //                   bottom: 1,
// //             //                   right: 0,
// //             //                   child: FlatButton(
// //             //                       onPressed: () {
// //             //                         cardKey.currentState.toggleCard();
// //             //                       },
// //             //                       child: Icon(Icons.menu)),
// //             //                 ),
// //             //               ],
// //             //             ),
// //             //             back: Stack(
// //             //               children: [
// //             //                 Container(
// //             //                   width: 165,
// //             //                   height: 220,
// //             //                   decoration: BoxDecoration(
// //             //                       image: DecorationImage(
// //             //                           image: AssetImage('assets/8.jpeg'),
// //             //                           fit: BoxFit.cover),
// //             //                       borderRadius: BorderRadius.circular(20),
// //             //                       border: Border.all(
// //             //                           color: Color(0xff707070).withOpacity(0.5))),
// //             //                 ),
// //             //                 Positioned(
// //             //                   bottom: 1,
// //             //                   right: 0,
// //             //                   child: FlatButton(
// //             //                       onPressed: () {
// //             //                         cardKey.currentState.toggleCard();
// //             //                       },
// //             //                       child: Icon(Icons.menu)),
// //             //                 ),
// //             //               ],
// //             //             ),
// //             //             // Positioned(
// //             //             //   bottom: 1,
// //             //             //   right: 1,
// //             //             //   child: Container(
// //             //             //     width: 165,
// //             //             //     height: 45,
// //             //             //     decoration: BoxDecoration(
// //             //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
// //             //             //         color: Colors.black54),
// //             //             //     // padding: EdgeInsets.all(8),
// //             //             //     child: Center(
// //             //             //       child: Text(
// //             //             //         'Strawberry Cheesecake',
// //             //             //         style: TextStyle(
// //             //             //           color: Colors.white,
// //             //             //           fontSize: 14,
// //             //             //         ),
// //             //             //         // softWrap: true,
// //             //             //         // overflow: TextOverflow.fade,
// //             //             //       ),
// //             //             //     ),
// //             //             //   ),
// //             //             // ),
// //             //           ),
// //             //         ),
// //             //         SizedBox(
// //             //           width: 6,
// //             //         ),
// //             //
// //             //         GestureDetector(
// //             //           onTap: (){
// //             //
// //             //             Navigator.push(
// //             //               context,
// //             //               MaterialPageRoute(builder: (context) => Recipe()),
// //             //             );
// //             //           },
// //             //           child:
// //             //           FlipCard(
// //             //             direction: FlipDirection.HORIZONTAL,
// //             //             key: cardKey,
// //             //             flipOnTouch: false,
// //             //             front: Stack(
// //             //               children: [
// //             //                 Container(
// //             //                   width: 165,
// //             //                   height: 220,
// //             //                   decoration: BoxDecoration(
// //             //                       image: DecorationImage(
// //             //                           image: AssetImage('assets/8.jpeg'),
// //             //                           fit: BoxFit.cover),
// //             //                       borderRadius: BorderRadius.circular(20),
// //             //                       border: Border.all(
// //             //                           color: Color(0xff707070).withOpacity(0.5))),
// //             //                 ),
// //             //                 Positioned(
// //             //                   bottom: 1,
// //             //                   right: 0,
// //             //                   child: FlatButton(
// //             //                       onPressed: () {
// //             //                         cardKey.currentState.toggleCard();
// //             //                       },
// //             //                       child: Icon(Icons.menu)),
// //             //                 ),
// //             //               ],
// //             //             ),
// //             //             back: Stack(
// //             //               children: [
// //             //                 Container(
// //             //                   width: 165,
// //             //                   height: 220,
// //             //                   decoration: BoxDecoration(
// //             //                       image: DecorationImage(
// //             //                           image: AssetImage('assets/8.jpeg'),
// //             //                           fit: BoxFit.cover),
// //             //                       borderRadius: BorderRadius.circular(20),
// //             //                       border: Border.all(
// //             //                           color: Color(0xff707070).withOpacity(0.5))),
// //             //                 ),
// //             //                 Positioned(
// //             //                   bottom: 1,
// //             //                   right: 0,
// //             //                   child: FlatButton(
// //             //                       onPressed: () {
// //             //                         cardKey.currentState.toggleCard();
// //             //                       },
// //             //                       child: Icon(Icons.menu)),
// //             //                 ),
// //             //               ],
// //             //             ),
// //             //             // Positioned(
// //             //             //   bottom: 1,
// //             //             //   right: 1,
// //             //             //   child: Container(
// //             //             //     width: 165,
// //             //             //     height: 45,
// //             //             //     decoration: BoxDecoration(
// //             //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
// //             //             //         color: Colors.black54),
// //             //             //     // padding: EdgeInsets.all(8),
// //             //             //     child: Center(
// //             //             //       child: Text(
// //             //             //         'Strawberry Cheesecake',
// //             //             //         style: TextStyle(
// //             //             //           color: Colors.white,
// //             //             //           fontSize: 14,
// //             //             //         ),
// //             //             //         // softWrap: true,
// //             //             //         // overflow: TextOverflow.fade,
// //             //             //       ),
// //             //             //     ),
// //             //             //   ),
// //             //             // ),
// //             //           ),
// //             //         )
// //             //       ],
// //             //     ),
// //             //   ],
// //             // ),
// //             Row(
// //               children: [
// //                 Column(
// //                   children: [
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 220.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 100.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 220.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 100.0,),
// //
// //
// //                   ],
// //                 ),
// //                 SizedBox(width: 20,),
// //                 Column(
// //                   children: [
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 100.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 220.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 100.0,),
// //                     SizedBox(height: 20,),
// //                     RecipeCard(height: 220.0,),
// //
// //
// //
// //                   ],
// //                 ),
// //
// //               ],
// //             )
// //           ],
// //         ));
// //   }
// // }
// //////////////////////////////////////////////////////////////////////////////////////////////////////
// // /////////////////////////////// flip card home code
//
//
//
//
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
//
// import 'RECIPE.dart';
//
// class RecipeCard extends StatefulWidget {
//   RecipeCard({this.height,this.name,this.duration});
//   final height;
//   final name;
//   final duration;
//   @override
//   _RecipeCardState createState() => _RecipeCardState();
// }
//
// class _RecipeCardState extends State<RecipeCard> {
//   get height => widget.height;
//   get name => widget.name;
//   get duration => widget.duration;
//   GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Recipe()),
//         );
//       },
//       child: FlipCard(
//         direction: FlipDirection.HORIZONTAL,
//         key: cardKey,
//         flipOnTouch: false,
//         front: Stack(
//           children: [
//             Container(
//               width: 165,
//               height: height,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/8.jpeg'), fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(20),
//                   border:
//                   Border.all(color: Color(0xff707070).withOpacity(0.5))),
//             ),
//             Positioned(
//               bottom: 1,
//               right: 0,
//               child: FlatButton(
//                   onPressed: () {
//                     cardKey.currentState.toggleCard();
//                   },
//                   child: Icon(Icons.menu)),
//             ),
//           ],
//         ),
//         back: Stack(
//           children: [
//             Container(
//               width: 165,
//               height: height,
//               // decoration: BoxDecoration(
//               //     boxShadow: [
//               //     BoxShadow(
//               //     color:  Color(0xffBC1017),
//               //     offset: Offset(0.0, 5.0),
//               //     blurRadius: 4.0),],
//               //     borderRadius: BorderRadius.circular(20),
//               //  ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               offset: Offset(0.0, 5.0),
//                               blurRadius: 4.0)
//                         ]),
//                     child: Container(
//                       alignment: Alignment.topCenter,
//                       //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
//                       //   BoxShadow(
//                       //       color: Colors.black12,
//                       //       offset: Offset(0.0, 5.0),
//                       //       blurRadius: 4.0)
//                       // ]),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               name.toString(),
//                               style: TextStyle(fontSize: 20,color:  Color(0xffBC1017)),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.access_time_outlined),
//                                 ),
//                                 Text(duration.toString())
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // decoration: BoxDecoration(
//               //     image: DecorationImage(
//               //         image: AssetImage('assets/8.jpeg'),
//               //         fit: BoxFit.cover),
//               //     borderRadius: BorderRadius.circular(20),
//               //     border: Border.all(
//               //         color: Color(0xff707070).withOpacity(0.5))),
//             ),
//             Positioned(
//               bottom: 1,
//               right: 0,
//               child: FlatButton(
//                   onPressed: () {
//                     cardKey.currentState.toggleCard();
//                   },
//                   child: Icon(Icons.menu)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////anady 3la el filter'
// if(messages.data['category'] == 'Lunch'){
// name=messages.data['name'];
// duration=messages.data['duration'];
// image=messages.data['image'];
// var height;
// var itemData = RecipeCard(
// height: height,
// name: name.toString(),
// image: image.toString(),
// duration: duration.toString(),);
// dataList.add(itemData);
// print(messages.documentID);
// }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////my code filter
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';
// import 'package:salmagrad/recipe_card.dart';
//
// import 'DataCard.dart';
// import 'SEARCH.dart';
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   _refresh(){
//     setState(() {
//
//     });
//   }
//   var _firebase= Firestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     String name; String duration;
//     String image;
//     String category = '';
//
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firebase.collection('Recipes').snapshots(),
//         builder:(context,message){
//           if(!message.hasData){
//             return Center(child: CircularProgressIndicator());
//           }
//           var data=message.data.documents;
//           print(data);
//           List<RecipeCard> dataList=[];
//           for(var messages in data)
//           {
//             // name=messages.data['name'];
//             // duration=messages.data['duration'];
//             // image=messages.data['image'];
//             //
//             //
//             //
//             // var height;
//             // var itemData = RecipeCard(
//             //   height: height,
//             //   name: name.toString(),
//             //   image: image.toString(),
//             //   duration: duration.toString(),);
//             // dataList.add(itemData);
//             // print(messages.documentID);
//
//             // if(messages.data['category'] == 'Lunch'){
//             //   name=messages.data['name'];
//             //   duration=messages.data['duration'];
//             //   image=messages.data['image'];
//             //   var height;
//             //   var itemData = RecipeCard(
//             //     height: height,
//             //     name: name.toString(),
//             //     image: image.toString(),
//             //     duration: duration.toString(),);
//             //   dataList.add(itemData);
//             //   print(messages.documentID);
//             // }
//           }
//           return ListView(
//             children: [
//               Row(
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[Container(height: 100.0)],
//                   ),
//                   SizedBox(
//                     width: 30.0,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context, MaterialPageRoute(builder: (context) => Search()));
//                     },
//                     child: Container(
//                         width: 300.0,
//                         height: 45.0,
//                         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               offset: Offset(0.0, 5.0),
//                               blurRadius: 4.0)
//                         ]),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Flexible(
//                               child: Container(
//                                 width: 160.0,
//                                 height: 35.0,
//                                 child: Container(
//                                   padding: EdgeInsets.only(top: 6.0),
//                                   child: Text('Search...',
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontWeight: FontWeight.w300)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 35.0),
//                             Icon(
//                               Icons.search,
//                               size: 28.0,
//                             ),
//                           ],
//                         )),
//                   ),
//
//                 ],
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//
//                     SizedBox(
//                       width: 5,
//                     ),
//                     AnimatedButton(
//                       onPress: (){
//                         setState(() {
//                           var data=message.data.documents;
//                           print(data);
//                           List<RecipeCard> dataList=[];
//                           for(var messages in data)
//                           {
//                             // if(messages.data['category'] == 'Breakfast'){
//                             //   name=messages.data['name'];
//                             //   duration=messages.data['duration'];
//                             //   image=messages.data['image'];
//                             //   var height;
//                             //   var itemData = RecipeCard(
//                             //     height: height,
//                             //     name: name.toString(),
//                             //     image: image.toString(),
//                             //     duration: duration.toString(),);
//                             //   dataList.add(itemData);
//                             //   print(messages.documentID);
//                             // }
//                           }
//                         }
//                         );
//                       },
//                       height: 40,
//                       width: 80,
//                       text: 'Breakfast',
//                       isReverse: true,
//                       selectedTextColor: Colors.black,
//                       selectedBackgroundColor: Color(0xff707070),
//                       transitionType: TransitionType.TOP_CENTER_ROUNDER,
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'ARIBLP.ttf',
//                       ),
//                       backgroundColor: Color(0xffBC1017),
//                       borderColor: Colors.white,
//                       borderRadius: 50,
//                       borderWidth: 2,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     AnimatedButton(
//
//                       onPress: (){
//                         for(var messages in data)
//                         {
//
//                           if(messages.data['category'] == 'Lunch') {
//                             name = messages.data['name'];
//                             duration = messages.data['duration'];
//                             image = messages.data['image'];
//                             var height;
//                             var itemData = RecipeCard(
//                               height: height,
//                               name: name.toString(),
//                               image: image.toString(),
//                               duration: duration.toString(),);
//                             dataList.add(itemData);
//                             print(messages.documentID);
//                           }
//                         }
//                         // setState(() {
//                         //   category='Lunch';
//                         //   print(category);
//                         //   var data=message.data.documents;
//                         //   print(data);
//                         //   List<RecipeCard> dataList=[];
//                         //   for(var messages in data)
//                         //   {
//                         //     if(messages.data['category'] == 'Lunch'){
//                         //       name=messages.data['name'];
//                         //       duration=messages.data['duration'];
//                         //       image=messages.data['image'];
//                         //       var height;
//                         //       var itemData = RecipeCard(
//                         //         height: height,
//                         //         name: name.toString(),
//                         //         image: image.toString(),
//                         //         duration: duration.toString(),);
//                         //       dataList.add(itemData);
//                         //       print(messages.documentID);
//                         //     }
//                         //   }
//                         // }
//                         // );
//                       },
//                       // }},
//                       isSelected: false,
//                       height: 40,
//                       width: 80,
//                       text: 'Lunch',
//                       isReverse: true,
//                       selectedTextColor: Colors.black,
//                       selectedBackgroundColor: Color(0xff707070),
//                       transitionType: TransitionType.TOP_CENTER_ROUNDER,
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'ARIBLP.ttf',
//                       ),
//                       backgroundColor: Color(0xffBC1017),
//                       borderColor: Colors.white,
//                       borderRadius: 50,
//                       borderWidth: 2,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     AnimatedButton(
//                       onPress: (){
//                         setState(() {
//                           category='Dinner';
//                           _refresh();
//                           print(category);
//                         });
//
//                       },
//                       height: 40,
//                       width: 80,
//                       text: 'Dinner',
//                       isReverse: true,
//                       selectedTextColor: Colors.black,
//                       selectedBackgroundColor: Color(0xff707070),
//                       transitionType: TransitionType.TOP_CENTER_ROUNDER,
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'ARIBLP.ttf',
//                       ),
//                       backgroundColor: Color(0xffBC1017),
//                       borderColor: Colors.white,
//                       borderRadius: 50,
//                       borderWidth: 2,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     AnimatedButton(
//                       height: 40,
//                       width: 100,
//                       text: 'Healthy Food',
//                       isReverse: true,
//                       selectedTextColor: Colors.black,
//                       selectedBackgroundColor: Color(0xff707070),
//                       transitionType: TransitionType.TOP_CENTER_ROUNDER,
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'ARIBLP.ttf',
//                       ),
//                       backgroundColor: Color(0xffBC1017),
//                       borderColor: Colors.white,
//                       borderRadius: 50,
//                       borderWidth: 2,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     AnimatedButton(
//                       height: 40,
//                       width: 80,
//                       text: 'Dessert',
//                       isReverse: true,
//                       selectedTextColor: Colors.black,
//                       selectedBackgroundColor: Color(0xff707070),
//                       transitionType: TransitionType.TOP_CENTER_ROUNDER,
//                       textStyle: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'ARIBLP.ttf',
//                       ),
//                       backgroundColor: Color(0xffBC1017),
//                       borderColor: Colors.white,
//                       borderRadius: 50,
//                       borderWidth: 2,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                   ],
//                 ),
//               ),
//               // Column(
//               //   children: [
//               //     SizedBox(
//               //       height: 10,
//               //     ),
//               //     Row(
//               //       children: [
//               //         SizedBox(
//               //           width: 10,
//               //         ),
//               //         GestureDetector(
//               //           onTap: (){
//               //
//               //             Navigator.push(
//               //               context,
//               //               MaterialPageRoute(builder: (context) => Recipe()),
//               //             );
//               //           },
//               //           child:
//               //           FlipCard(
//               //             direction: FlipDirection.HORIZONTAL,
//               //             key: cardKey,
//               //             flipOnTouch: false,
//               //             front: Stack(
//               //               children: [
//               //                 Container(
//               //                   width: 165,
//               //                   height: 220,
//               //                   decoration: BoxDecoration(
//               //                       image: DecorationImage(
//               //                           image: AssetImage('assets/8.jpeg'),
//               //                           fit: BoxFit.cover),
//               //                       borderRadius: BorderRadius.circular(20),
//               //                       border: Border.all(
//               //                           color: Color(0xff707070).withOpacity(0.5))),
//               //                 ),
//               //                 Positioned(
//               //                   bottom: 1,
//               //                   right: 0,
//               //                   child: FlatButton(
//               //                       onPressed: () {
//               //                         cardKey.currentState.toggleCard();
//               //                       },
//               //                       child: Icon(Icons.menu)),
//               //                 ),
//               //               ],
//               //             ),
//               //             back: Stack(
//               //               children: [
//               //                 Container(
//               //                   width: 165,
//               //                   height: 220,
//               //                   decoration: BoxDecoration(
//               //                       image: DecorationImage(
//               //                           image: AssetImage('assets/8.jpeg'),
//               //                           fit: BoxFit.cover),
//               //                       borderRadius: BorderRadius.circular(20),
//               //                       border: Border.all(
//               //                           color: Color(0xff707070).withOpacity(0.5))),
//               //                 ),
//               //                 Positioned(
//               //                   bottom: 1,
//               //                   right: 0,
//               //                   child: FlatButton(
//               //                       onPressed: () {
//               //                         cardKey.currentState.toggleCard();
//               //                       },
//               //                       child: Icon(Icons.menu)),
//               //                 ),
//               //               ],
//               //             ),
//               //             // Positioned(
//               //             //   bottom: 1,
//               //             //   right: 1,
//               //             //   child: Container(
//               //             //     width: 165,
//               //             //     height: 45,
//               //             //     decoration: BoxDecoration(
//               //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
//               //             //         color: Colors.black54),
//               //             //     // padding: EdgeInsets.all(8),
//               //             //     child: Center(
//               //             //       child: Text(
//               //             //         'Strawberry Cheesecake',
//               //             //         style: TextStyle(
//               //             //           color: Colors.white,
//               //             //           fontSize: 14,
//               //             //         ),
//               //             //         // softWrap: true,
//               //             //         // overflow: TextOverflow.fade,
//               //             //       ),
//               //             //     ),
//               //             //   ),
//               //             // ),
//               //           ),
//               //         ),
//               //         SizedBox(
//               //           width: 6,
//               //         ),
//               //
//               //         GestureDetector(
//               //           onTap: (){
//               //
//               //             Navigator.push(
//               //               context,
//               //               MaterialPageRoute(builder: (context) => Recipe()),
//               //             );
//               //           },
//               //           child:
//               //           FlipCard(
//               //             direction: FlipDirection.HORIZONTAL,
//               //             key: cardKey,
//               //             flipOnTouch: false,
//               //             front: Stack(
//               //               children: [
//               //                 Container(
//               //                   width: 165,
//               //                   height: 220,
//               //                   decoration: BoxDecoration(
//               //                       image: DecorationImage(
//               //                           image: AssetImage('assets/8.jpeg'),
//               //                           fit: BoxFit.cover),
//               //                       borderRadius: BorderRadius.circular(20),
//               //                       border: Border.all(
//               //                           color: Color(0xff707070).withOpacity(0.5))),
//               //                 ),
//               //                 Positioned(
//               //                   bottom: 1,
//               //                   right: 0,
//               //                   child: FlatButton(
//               //                       onPressed: () {
//               //                         cardKey.currentState.toggleCard();
//               //                       },
//               //                       child: Icon(Icons.menu)),
//               //                 ),
//               //               ],
//               //             ),
//               //             back: Stack(
//               //               children: [
//               //                 Container(
//               //                   width: 165,
//               //                   height: 220,
//               //                   decoration: BoxDecoration(
//               //                       image: DecorationImage(
//               //                           image: AssetImage('assets/8.jpeg'),
//               //                           fit: BoxFit.cover),
//               //                       borderRadius: BorderRadius.circular(20),
//               //                       border: Border.all(
//               //                           color: Color(0xff707070).withOpacity(0.5))),
//               //                 ),
//               //                 Positioned(
//               //                   bottom: 1,
//               //                   right: 0,
//               //                   child: FlatButton(
//               //                       onPressed: () {
//               //                         cardKey.currentState.toggleCard();
//               //                       },
//               //                       child: Icon(Icons.menu)),
//               //                 ),
//               //               ],
//               //             ),
//               //             // Positioned(
//               //             //   bottom: 1,
//               //             //   right: 1,
//               //             //   child: Container(
//               //             //     width: 165,
//               //             //     height: 45,
//               //             //     decoration: BoxDecoration(
//               //             //         borderRadius: BorderRadius.all(Radius.circular(20)),
//               //             //         color: Colors.black54),
//               //             //     // padding: EdgeInsets.all(8),
//               //             //     child: Center(
//               //             //       child: Text(
//               //             //         'Strawberry Cheesecake',
//               //             //         style: TextStyle(
//               //             //           color: Colors.white,
//               //             //           fontSize: 14,
//               //             //         ),
//               //             //         // softWrap: true,
//               //             //         // overflow: TextOverflow.fade,
//               //             //       ),
//               //             //     ),
//               //             //   ),
//               //             // ),
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //   ],
//               // ),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       for(var object in dataList)
//                         object,
//
//                       // SizedBox(height: 20,),
//                       // RecipeCard(height: 220.0,  name: name.toString(),
//                       //   duration: duration.toString(),),
//                       // SizedBox(height: 20,),
//                       // RecipeCard(height: 100.0, name: name.toString(),
//                       //   duration: duration.toString(),),
//                       // SizedBox(height: 20,),
//                       // RecipeCard(height: 220.0,),
//                       // SizedBox(height: 20,),
//                       // RecipeCard(height: 100.0,),
//
//
//                     ],
//                   ),
//
//                   // Column(
//                   //   children: [
//                   //     SizedBox(height: 20,),
//                   //     RecipeCard(height: 100.0,),
//                   //     SizedBox(height: 20,),
//                   //     RecipeCard(height: 220.0,),
//                   //     SizedBox(height: 20,),
//                   //     RecipeCard(height: 100.0,),
//                   //     SizedBox(height: 20,),
//                   //     RecipeCard(height: 220.0,),
//                   //
//                   //
//                   //
//                   //   ],
//                   // ),
//
//                 ],
//               )
//
//
//
//               // ,for(var message in dataList)
//               //   message,
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////search abl ma a3ml fih 7aga
// import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:salmagrad/HOME.dart';
// import 'package:salmagrad/PAGE.dart';
// import 'package:salmagrad/LOGIN.dart';
// import 'package:salmagrad/RECIPE.dart';
// import 'package:salmagrad/SIGN%20UP.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:searchfield/searchfield.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:salmagrad/HOME.dart';
// import 'package:salmagrad/PAGE.dart';
// import 'package:salmagrad/LOGIN.dart';
// import 'package:salmagrad/SIGN%20UP.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:searchfield/searchfield.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
//
// class AddIng extends StatefulWidget {
//   @override
//   _AddIngState createState() => _AddIngState();
// }
//
// class Component {
//   String name;
//   String time;
// }
//
// class _AddIngState extends State<AddIng> {
//   static const historyLength = 5;
//
//   CollectionReference _firebaseFirestore =
//   Firestore.instance.collection("Recipes");
//   var docId;
//   String Ing;
//   bool spinner = false;
//
//   List<String> _searchHistory = [];
//
//   List<String> filteredSearchHistory;
//
//   String selectedTerm;
//
//   List<String> filterSearchTerms({
//     @required String filter,
//   }) {
//     if (filter != null && filter.isNotEmpty) {
//       return _searchHistory.reversed
//           .where((term) => term.startsWith(filter))
//           .toList();
//     } else {
//       return _searchHistory.reversed.toList();
//     }
//   }
//
//   void addSearchTerm(String term) {
//     if (_searchHistory.contains(term)) {
//       putSearchTermFirst(term);
//       return;
//     }
//
//     _searchHistory.add(term);
//     if (_searchHistory.length > historyLength) {
//       _searchHistory.removeRange(0, _searchHistory.length - historyLength);
//     }
//
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   void deleteSearchTerm(String term) {
//     _searchHistory.removeWhere((t) => t == term);
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   void putSearchTermFirst(String term) {
//     deleteSearchTerm(term);
//     addSearchTerm(term);
//   }
//
//   FloatingSearchBarController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = FloatingSearchBarController();
//     filteredSearchHistory = filterSearchTerms(filter: null);
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   var _firebase = Firestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     String name;
//     String duration;
//
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firebase.collection('Recipes').snapshots(),
//         builder: (context, message) {
//           if (!message.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           var data = message.data.documents;
//           _firebase.collection("Recipes").getDocuments().then((querySnapshot) {
//             querySnapshot.documents.forEach((doc) {
//               var id = doc.documentID; // randomly generated document ID
//               var data = doc.data;
//               print(
//                   'id = ${id.toString()}    ........ data = ${data.toString()}');
//               // key-value pairs from the document
//             });
//           });
//           List<String> dataList = [];
//
//           for (var messages in data) {
//             print('///////////////////////////////////////////////');
//             print(message.data);
//             name = messages.data['name'];
//             print(name);
//             _searchHistory.add(name);
//             duration = messages.data['duration'];
//
//             // data.name = 'meat';
//             // data.time = '60 mins';
//             // var itemData = RecipeCard(//               height: 220.0,
//             //   name: name.toString(),
//             //   duration: duration.toString(),);
//             // dataList.add(data);
//
//             print(messages.documentID);
//           }
//           return FloatingSearchBar(
//             elevation: 20,
//             shadowColor: Color(0xffBC1017),borderRadius: BorderRadius.circular(25),
//             controller: controller,
//             body: FloatingSearchBarScrollNotifier(
//               child: SearchResultsListView(
//                 searchTerm: selectedTerm,
//               ),
//             ),
//             transition: CircularFloatingSearchBarTransition(),
//             physics: BouncingScrollPhysics(),
//             title: Text(
//               selectedTerm ?? 'Enter Ingredients',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             hint: 'Enter Ingredients',
//             actions: [
//               FloatingSearchBarAction.icon(icon: Icons.search, onTap: () {}),
//             ],
//             onQueryChanged: (query) {
//               setState(() {
//                 filteredSearchHistory = filterSearchTerms(filter: query);
//               });
//             },
//             onSubmitted: (query) {
//               setState(() {
//                 addSearchTerm(query);
//                 selectedTerm = query;
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Recipe()));
//               });
//               controller.close();
//             },
//             builder: (context, transition) {
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Material(
//                   color: Colors.white,
//                   elevation: 4,
//                   child: Builder(
//                     builder: (context) {
//                       if (filteredSearchHistory.isEmpty &&
//                           controller.query.isEmpty) {
//                         return Container(
//                           height: 56,
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Start adding ingredients',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.caption,
//                           ),
//                         );
//                       } else if (filteredSearchHistory.isEmpty) {
//                         return ListTile(
//                           title: Text(controller.query),
//                           leading: const Icon(Icons.add),
//                           onTap: () {
//                             setState(() {
//                               addSearchTerm(controller.query);
//                               selectedTerm = controller.query;
//                             });
//                             controller.close();
//                           },
//                         );
//                       } else {
//                         return Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: filteredSearchHistory
//                               .map(
//                                 (term) => ListTile(
//                               title: Text(
//                                 term,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               leading: const Icon(Icons.history),
//                               trailing: IconButton(
//                                 icon: const Icon(Icons.clear),
//                                 onPressed: () {
//                                   setState(() {
//                                     deleteSearchTerm(term);
//                                   });
//                                 },
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   putSearchTermFirst(term);
//                                   selectedTerm = term;
//                                 });
//                                 controller.close();
//                               },
//                             ),
//                           )
//                               .toList(),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class SearchResultsListView extends StatelessWidget {
//   final String searchTerm;
//
//   const SearchResultsListView({
//     Key key,
//     @required this.searchTerm,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (searchTerm == null) {
//       return Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.add,
//               size: 64,
//             ),
//             Text(
//               'Start adding ingredients',
//               style: Theme.of(context).textTheme.headline5,
//             )
//           ],
//         ),
//       );
//     }
//
//     final fsb = FloatingSearchBar.of(context);
//
//     return ListView(
//       padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
//       children: List.generate(
//         1,
//             (index) => ListTile(
//           title: Text('$searchTerm search result'),
// // subtitle: Text(index.toString()),
//         ),
//       ),
//     );
//   }
// }
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////floating search eli yassin  3dl fih
// FloatingSearchBar(
// elevation: 20,
// shadowColor: Color(0xffBC1017),
// borderRadius: BorderRadius.circular(25),
// controller: controller,
// body: FloatingSearchBarScrollNotifier(
// child: ListView(
// children: [
// SizedBox(height: 60,),
// for(var card in displayCards)
// card
// ]
// ,
// )
// ),
// transition: CircularFloatingSearchBarTransition(),
// physics: BouncingScrollPhysics(),
// title: Text(
// selectedTerm ?? 'Enter Ingredients',
// style: Theme.of(context).textTheme.headline6,
// ),
// hint: 'Enter Ingredients',
// actions: [
// FloatingSearchBarAction.icon(icon: Icons.search, onTap: () {
// }),
// ],
//
// onQueryChanged: (query) {
// setState(() {
// filteredSearchHistory = filterSearchTerms(filter: query);
// if(query !='')
// {
// _getCardForSearch(query);
// }
// });
// },
// onSubmitted: (query) {
// print('item chosen ..... ');
// setState(() {
// addSearchTerm(query);
// selectedTerm = query;
// });
// controller.close();
// },
//
// builder: (context, transition) {
// return ClipRRect(
// borderRadius: BorderRadius.circular(8),
// child: Container()
// );
// },
// )
// Material(
// color: Colors.white,
// elevation: 4,
// child: Builder(
// builder: (context) {
// if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
// return Container(
// height: 56,
// width: double.infinity,
// alignment: Alignment.center,
// child: Text(
// 'Start adding ingredients',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context).textTheme.caption,
// ),
// );
// } else if (filteredSearchHistory.isEmpty) {
// return ListTile(
// title: Text(controller.query),
// leading: const Icon(Icons.add),
// onTap: () {
// setState(() {
// addSearchTerm(controller.query);
// selectedTerm = controller.query;
// });
// controller.close();
// },
// );
// } else {
// return Column(
// mainAxisSize: MainAxisSize.min,
// children: filteredSearchHistory
//     .map(
// (term) => ListTile(
// title: Text(
// term,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// leading: const Icon(Icons.history),
// trailing: IconButton(
// icon: const Icon(Icons.clear),
// onPressed: () {
// setState(() {
// deleteSearchTerm(term);
// });
// },
// ),
// onTap: () {
// setState(() {
// putSearchTermFirst(term);
// selectedTerm = term;
// });
// controller.close();
// },
// ),
// )
//     .toList(),
// );
// }
// },
// ),
// ),
/////////////////////////////////////////////////////////////////////////////////////////UI search el adeem

// import 'package:flutter/material.dart';
//
// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: ListView(
//           children: <Widget>[
//             _buscadorSeccion(context),
//             _recentRecipe(),
//           ],
//         ));
//   }
//
//   Widget _buscadorSeccion(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Column(
//           children: <Widget>[Container(height: 100.0)],
//         ),
//         SizedBox(
//           width: 30.0,
//         ),
//         Container(
//             width: 300.0,
//             height: 45.0,
//             decoration: BoxDecoration(color: Colors.white, boxShadow: [
//               BoxShadow(
//                   color: Colors.black12,
//                   offset: Offset(0.0, 5.0),
//                   blurRadius: 4.0)
//             ]),
//             child: Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: 15.0,
//                 ),
//                 Flexible(
//                   child: Container(
//                     width: 160.0,
//                     height: 35.0,
//                     child: Container(
//                         padding: EdgeInsets.only(top: 6.0),
//                         child: Text('Search...',
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontWeight: FontWeight.w300))),
//                   ),
//                 ),
//                 SizedBox(width: 35.0),
//                 Container(
//                   width: 50.0,
//                   height: 35.0,
//                   child: InkWell(
//                     // onTap: () {
//                     //   Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //           builder: (context) => ResultsPage()));
//                     // },
//                     // child: Icon(Icons.search, size: 28.0),
//                   ),
//                 )
//               ],
//             )),
//         SizedBox(
//           width: 15.0,
//         ),
//
//         // Flexible(
//         //   child:
//         //   Container(
//         //     width: 45.0,
//         //     height: 45.0,
//         //     decoration: BoxDecoration(color: Colors.green, boxShadow: [
//         //       BoxShadow(
//         //           color: Colors.black12,
//         //           offset: Offset(0.0, 5.0),
//         //           blurRadius: 4.0)
//         //     ]),
//         //     child: Icon(
//         //       Icons.filter_list,
//         //       size: 28.0,
//         //     ),
//         //   ),
//         // )
//       ],
//     );
//   }
//
//   Widget _recentRecipe() {
//     return Column(children: <Widget>[
//       Container(
//           padding: EdgeInsets.only(left: 30.0, bottom: 10.0),
//           alignment: Alignment.topLeft,
//           child: Text('Recent Searches',
//               style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w300))),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Mid Fade',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//       Stack(children: <Widget>[
//         Column(
//           children: <Widget>[
//             Container(
//               width: 330.0,
//               height: 150.0,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.45), BlendMode.multiply),
//                       image: AssetImage('assets/1.jpeg'),
//                       fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(0.0, 5.0),
//                         blurRadius: 4.0),
//                   ]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         'Line Up',
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300),
//                       ),
//                       Container(
//                         width: 23.0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       SizedBox(height: 10.0),
//     ]);
//   }
// }
