import 'package:flutter/material.dart';
import 'package:foodz/dummy.dart';
//import '../models/meals.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/mealdetail";
  final Function toggle;
  final Function isFav;
  MealDetail(this.toggle, this.isFav);
  Widget buildTitle(BuildContext context, String tx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        tx,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget ch) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ch,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()=>toggle(mealid),
          child: Icon(
            isFav(mealid) ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context,mealid);
      //   },
      //   child: Icon(Icons.delete),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
    );
  }
}
