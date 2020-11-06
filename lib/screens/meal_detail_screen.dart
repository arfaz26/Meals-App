import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetailScreen';

  Widget buildTilteTile({BuildContext context, String text}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

// gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
//           childAspectRatio: 3 / 2,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//         ),

  Widget buildContainer({BuildContext context, Widget child}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      height: 300,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildTilteTile(
              context: context,
              text: 'Ingredients',
            ),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('${selectedMeal.ingredients[index]}'),
                  leading: Icon(
                    Icons.arrow_right,
                  ),
                ),
              ),
            ),
            buildTilteTile(context: context, text: 'Steps'),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
