import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'RECIPE.dart';

class RecipeCard extends StatefulWidget {
  final recipe;
  final height;
  RecipeCard(this.recipe, this.height);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  get id => widget.recipe.id;
  get height => widget.height;
  get name => widget.recipe.name;
  get image => widget.recipe.image;
  get cooktime => widget.recipe.cooktime;
  get preptime => widget.recipe.preptime;
  get steps => widget.recipe.steps;
  get ingredients => widget.recipe.ingredients;
  get destination_link => widget.recipe.destination_link;
  get category => widget.recipe.category;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipePage(
                  recipe: widget.recipe
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 25,
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.45), BlendMode.multiply),
                      image: NetworkImage(image),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 5.0),
                        blurRadius: 4.0),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ARIBLP.ttf',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
