import 'package:flutter/material.dart';
import '../dummy_dart.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    //This is a builder method
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Ingredients',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments
        as String; //Extract aruments from named routes.
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      //Scaffold is needed for each new page.
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('STEP #${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
            Divider(
              //Adds a line that separates the items.
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
