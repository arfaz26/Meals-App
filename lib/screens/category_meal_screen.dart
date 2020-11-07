import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String categoryTitle;
  // final String categoryId;

  static const routName = '/categoryMealScreen';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  bool _changed = false;
  String categoryId;
  String categoryTitle;
  List<Meal> categoryMeal;
  @override
  void initState() {
    // print('init state called');
    super.initState();
  }

  void didChangeDependencies() {
    // print('did changed');
    if (!_changed) {
      final arg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = arg['title'];
      categoryId = arg['id'];
      categoryMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _changed = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(mealId) {
    // categoryMeal.where((meal) => )
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == mealId);
      // print(categoryMeal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: categoryMeal.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, i) {
                return MealItem(
                  id: categoryMeal[i].id,
                  title: categoryMeal[i].title,
                  imageUrl: categoryMeal[i].imageUrl,
                  duration: categoryMeal[i].duration,
                  affordability: categoryMeal[i].affordability,
                  complexity: categoryMeal[i].complexity,
                );
              },
              itemCount: categoryMeal.length,
            )
          : Center(
              child: Text(
                'No Meals!, go back to get Your Meals back :)',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
            ),
    );
  }
}
