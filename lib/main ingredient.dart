import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:salmagrad/recipe_card.dart';

import 'DataCard.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var _firebase= Firestore.instance;
  @override
  Widget build(BuildContext context) {
    String name; String type;
    return   StreamBuilder<QuerySnapshot>(
        stream: _firebase.collection('main_ingredients').snapshots(),
        builder:(context,message){
          if(!message.hasData){
            return Center(child: CircularProgressIndicator());
          }
          var data=message.data.documents;
          List<RecipeCard> dataList=[];
          for(var messages in data)
          {
            name=messages.data['name'];

            // var itemData = RecipeCard(
            //   height: 220.0,
            //   name: name.toString(),
            //   duration: type.toString(),);
            // dataList.add(itemData);

            print(messages.documentID);
          }
          return ListView(
            children: [




              for(var card in dataList)
                card,
            ],
          );
        },
      );

  }
}
