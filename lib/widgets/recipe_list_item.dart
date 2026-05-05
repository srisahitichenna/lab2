
import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

@override
Widget build(BuildContext context) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell( // Nytt
    borderRadius: BorderRadius.circular(12),
    splashColor: Colors.blue.withAlpha(30),
    onTap: onTap,
    child: Container(
      height: 128,
      child: Row(
        children: [
          _image(recipe),
          SizedBox(width: 12), 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(recipe.name, style: AppTheme.mediumHeading),
                 SizedBox(height: 4), 
                Text(
                  recipe.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 4), 
                Row(
  children: [
    Image.asset(Assets.timeIcon, width: 16),
    SizedBox(width: 4),
    Text('${recipe.time} min'),

    SizedBox(width: 12),

    Difficulty.icon(recipe.difficulty, width: 48)!,

     SizedBox(width: 12),

    Text('${recipe.price} kr'),
  ],
),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
  );
}
Widget _image(Recipe recipe) {
  var square = ClipRect(
    child: Container(
      width: 104, // Square width
      height: 104, // Square height
      child: FittedBox(fit: BoxFit.cover, child: recipe.image),
    ),
  );
var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

  return Stack(
    children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
  );
 }
}


