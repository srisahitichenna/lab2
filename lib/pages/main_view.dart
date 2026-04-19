import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';




class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
Widget build(BuildContext context) {
   return Scaffold(
   body: Row(children: [_controlPanel(context), _recipeArea(context)]),
 );
}

Widget _controlPanel(context, { double width = 320}) {
  return Container(
    width: width,
    color: const Color.fromARGB(255, 176, 225, 248),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text( 
            'My Title')
          ),
        Text( 'Hitta ett recept som passar genom att ändra iställningarna nedanför'),

        Row(
          children: [
            Text(" Ingrediens:"),
            SizedBox( width: 12),
            IngredientControl()]),

         Row(
          children: [
            Text(" Kök:"),
            SizedBox( width: 12),
            KitchenControl()]),

        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Svårighetsgrad"),
              SizedBox( width: 10),
              DifficulyControl()]),

          Column(
            children: [
              Text( "Maxpris"),
              PriceControl()]
          ),

          Column(
            children: [
              Text( "Maxtid"),
              TimeControl(),]
          )
      ],
    )
    

  );
}

Widget _recipeArea(context) {
  return Expanded(
    child: Container(
      //color: const Color.fromARGB(255, 204, 216, 176),
      child: RecipeList(),
    ),
 );
}

}


