import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meal_screen.dart';

class CategeryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategeryItem(
    this.id,
    this.title,
    this.color,
  );

  void itemScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        itemScreen(context);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
