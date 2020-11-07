import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorite = [];
  bool isFavorite(String id) {
    return _favorite.any((meal) => meal.id == id);
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favorite.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favorite.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favorite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      // home: TabsScreen(),

      routes: {
        '/': (ctx) => TabsScreen(_favorite),
        CategoryMealScreen.routName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filter, _setFilter),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.name);
      //   //   if (settings.name == '') {
      //   //     return ...;
      //   //   }
      //   //   else{

      //   // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //   // }
      // },
      // onUnknownRoute: (settings) {
      //   print(settings.name);
      // },
    );
  }
}
