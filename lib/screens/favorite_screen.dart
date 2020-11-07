import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorite;
  FavoriteScreen(this.favorite);

  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Center(
        child: Container(
          child: Text(
            'You currently have no favorites, Try adding one',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: favorite[i].id,
            title: favorite[i].title,
            imageUrl: favorite[i].imageUrl,
            duration: favorite[i].duration,
            affordability: favorite[i].affordability,
            complexity: favorite[i].complexity,
          );
        },
        itemCount: favorite.length,
      );
    }
  }
}
