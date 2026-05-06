
import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

@override
Widget build(context, { double width = 320}) {
  return Container(
    width: width,
    color: const Color.fromARGB(255, 248, 252, 207),
    padding: const EdgeInsets.only(left: 12),
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Logo(),
        /*Center(
          child: Text( 
            'My Title')
          ),*/
        Center(
          child:
        Text( 'Hitta ett recept som passar genom att ändra iställningarna nedanför', textAlign: TextAlign.center,)),

        
        IngredientControl(),

         
        KitchenControl(),

        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text( "Svårighetsgrad"),
              SizedBox( width: 10),
              DifficulyControl()]),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Maxpris"),
              PriceControl()]
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Maxtid"),
              TimeControl(),]
          )
      ],
    )
    

  );
}

}