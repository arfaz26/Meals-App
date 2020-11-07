import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map(
            (dummy) => CategeryItem(
              dummy.id,
              dummy.title,
              dummy.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
