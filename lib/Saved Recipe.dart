import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salmagrad/SIGN UP.dart';
import 'package:salmagrad/recipe_card.dart';

import 'RECIPE.dart';


class Saved_recipes extends StatefulWidget {
  final height;
  final name;
  final duration;
  final savedRecipes;
  Saved_recipes({this.savedRecipes, this.height, this.name, this.duration});
  @override
  _Saved_recipesState createState() => _Saved_recipesState();
}




class _Saved_recipesState extends State<Saved_recipes> {
  get height => widget.height;
  get name => widget.name;
  get duration => widget.duration;


  @override
  Widget build(BuildContext context) {
    var savedRecipesCards = <RecipeCard>[];
    for (var savedRecipe in widget.savedRecipes){
      savedRecipesCards.add(new RecipeCard(savedRecipe, 150));
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipePage()),
        );
      },
      child: Container(
        child: SingleChildScrollView(
          child: Column(
              // width: MediaQuery.of(context).size.width,
              // height: 1700,
              children:[ Row(
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                      children: savedRecipesCards
                  )
                ],
              )
          ]),
        ),
          ),
    );
  }
}
