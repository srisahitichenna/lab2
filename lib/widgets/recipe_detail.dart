import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    children: [
      SizedBox(width: 16),

      SizedBox(
        height: 240,
        width: 240,
        child: recipe.customImage(),
      ),

      SizedBox(width: 16),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.name, style: AppTheme.mediumHeading),

            SizedBox(height: 8),

            Text("Tillagning", style: AppTheme.mediumHeading),
            Text(recipe.description),

            SizedBox(height: 12),

            Text("Ingredienser", style: AppTheme.mediumHeading),
            Text(recipe.ingredients.join(", ")),

            Spacer(),

            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  uiController.deselectRecipe();
                },
              ),
            ),
          ],
        ),
      ),

      SizedBox(width: 16),
    ],
  ),
);
}
}