import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  DataCard({this.name, this.type});
  final String name;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        color: Colors.tealAccent,
        elevation: 20,
        child: Column(
          children: <Widget>[
            Text('Name : $name',style: TextStyle(
              fontSize: 20,
              color: Colors.redAccent,
            ),),
            Text('Type : $type',style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
            )),
          ],
        ),
      ),
    );
  }
}
