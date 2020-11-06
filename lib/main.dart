import 'package:flutter/material.dart';
// import 'package:meals_app/widgets/meal_item.dart';
import 'screens/category_meal_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 24.0,
              fontFamily: 'RobotoCondensed',
            )),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMealScreen.routName: (ctx) => CategoryMealScreen(),
        // MealItem.routeName: (ctx)=> Meal
      },
    );
  }
}