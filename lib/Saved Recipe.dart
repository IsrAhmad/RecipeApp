import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RECIPE.dart';

class Saved_recipes extends StatefulWidget {
  Saved_recipes({this.height, this.name, this.duration});
  final height;
  final name;
  final duration;
  @override
  _Saved_recipesState createState() => _Saved_recipesState();
}

class _Saved_recipesState extends State<Saved_recipes> {
  get height => widget.height;
  get name => widget.name;
  get duration => widget.duration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipePage()),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: Row(
            children: [
              Image.asset(
                'assets/1.jpeg',
                width: 120,
                height: 130,
                fit: BoxFit.cover,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Grilled Chicken with Lemon',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'ARIBLP.ttf',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 25,
                            color: Colors.grey,
                          ),
                          Text(
                            '1h.30min',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'ARIBLP.ttf',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.beenhere), onPressed: () {
                        print('');
                      }),
                    ],
                  )
                ],
              )
            ],
          )
          ),
    );
  }
}
