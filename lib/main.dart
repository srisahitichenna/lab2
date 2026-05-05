import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';



/*void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipeHandler(
        child: const MyApp(),
      ),
      child: const MyApp(),
    ),
  );
}*/

/*{
  runApp(const MyApp());
}*/

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeHandler(
          child: const MyApp(),
        )),
        ChangeNotifierProvider(create: (context) => UIController()),
      ],
      child: const MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receptsök',
      theme: ThemeData(
        colorScheme: /*ColorScheme.fromSeed(seedColor: Colors.deepPurple)*/
                    AppTheme.colorScheme,
      textTheme: /*GoogleFonts.nunitoTextTheme()*/
                    AppTheme.textTheme,
      ),
      home: MainView(),
    );
  }
}
