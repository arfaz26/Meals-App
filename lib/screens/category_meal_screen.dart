import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryTitle;
  // final String categoryId;

  static const routName = '/categoryMealScreen';

  // CategoryMealScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = arg['title'];
    final categoryId = arg['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            title: categoryMeal[i].title,
            imageUrl: categoryMeal[i].imageUrl,
            duration: categoryMeal[i].duration,
            affordability: categoryMeal[i].affordability,
            complexity: categoryMeal[i].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
