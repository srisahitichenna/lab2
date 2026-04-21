import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Row( 
      children:[

        SizedBox(width: 50),

        SizedBox(
          height: 300,
          width: 300,
          child: recipe.customImage()
        ),

        SizedBox(width: 30),

        Text(recipe.name),

        SizedBox(width: 30),

        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            uiController.deselectRecipe();
      },
        ),
        
      ],
    );
}
}