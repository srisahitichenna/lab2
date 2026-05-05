import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficulyControl extends StatefulWidget {
   const DifficulyControl({super.key});

   @override
   State<DifficulyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficulyControl> {
  String _difficulty = Difficulty.labels[0];

   @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return RadioGroup<String>(
      groupValue: _difficulty,
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
        });
        recipeHandler.setDifficulty(value);
      },
      
      child: Column(
        children: [
          for (int i = 0; i < Difficulty.labels.length; i++)
            RadioListTile<String>(
              dense: true,
              title: 
               Row(
                children: [
                  if (Difficulty.icons[i] != null) ...[
                  Difficulty.icons[i]!,
                  ],
                 /* ...spread operation, for inserting multple elements -google*/
                  SizedBox(width: AppTheme.paddingMedium),
                  Text(Difficulty.labels[i])
                ],
              ),/*Text(label)*/
              value: Difficulty.labels[i],
              /* leadingIcon:*/

            ),
        ],
      ),
    );
  }
}

