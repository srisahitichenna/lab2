import 'package:flutter/material.dart';
import 'package:lab2/pages/control_panel.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:provider/provider.dart';




class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
Widget build(BuildContext context) {
   return Scaffold(
   body: Row(children: [ControlPanel(), SizedBox(width: 5), RecipeArea()]),
 );
}



/*Widget _recipeArea(context) {
  return Expanded(
    child: Container(
      //color: const Color.fromARGB(255, 204, 216, 176),
      child: RecipeList(),
    ),
 );
}*/

/*Widget _recipeArea(context) {
  var showList = true;
  var contents = showList ? RecipeList() : RecipeDetail();

  return Expanded(child: contents);
}*/

}

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
       contents = RecipeList();
    } else {
       contents = RecipeDetail(uiController.selectedRecipe!);
    }
    return Expanded(child: contents);
  }
}



