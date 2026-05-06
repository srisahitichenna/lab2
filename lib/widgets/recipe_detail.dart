import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _image(recipe),

                  SizedBox(height: AppTheme.paddingMedium),

                  Text('Ingredienser', style: AppTheme.mediumHeading),
                  SizedBox(height: AppTheme.paddingSmall),

                  Text('${recipe.servings} portioner'),
                  SizedBox(height: AppTheme.paddingSmall),

                  Text(
                  recipe.ingredients.join('\n'),
                  ),
                ],
              ),
            ),

            SizedBox(width: AppTheme.paddingLarge),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          recipe.name,
                          style: AppTheme.largeHeading,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: uiController.deselectRecipe,
                      ),
                    ],
                  ),

                  SizedBox(height: AppTheme.paddingSmall),

                Row(
  children: [
    if (MainIngredient.icon(recipe.mainIngredient, width: 20) != null)
      MainIngredient.icon(recipe.mainIngredient, width: 20)!,

    SizedBox(width: AppTheme.paddingSmall),

    if (Difficulty.icon(recipe.difficulty, width: 30) != null)
      Difficulty.icon(recipe.difficulty, width: 30)!,

    SizedBox(width: AppTheme.paddingSmall),

    Text('${recipe.time} minuter'),

    SizedBox(width: AppTheme.paddingSmall),

    Text('${recipe.price}kr'),
  ],
),

                  SizedBox(height: AppTheme.paddingMediumSmall),

                  Text(recipe.description),

                  SizedBox(height: AppTheme.paddingLarge),

                  Text('Tillagning:', style: AppTheme.mediumHeading),
                  SizedBox(height: AppTheme.paddingSmall),

                  Text(recipe.instruction),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    final flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: SizedBox(
            height: 240,
            width: 300,
            child: FittedBox(
              fit: BoxFit.cover,
              child: recipe.customImage(),
            ),
          ),
        ),
        if (flagImage != null)
          Positioned(
            bottom: AppTheme.paddingSmall,
            right: AppTheme.paddingSmall,
            child: flagImage,
          ),
      ],
    );
  }
}