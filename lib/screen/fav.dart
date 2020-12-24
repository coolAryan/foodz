import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widget/meal_item.dart';

class Favourite extends StatelessWidget {
  final List<Meal> favouriteMeals;
  Favourite(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favourite yet-start adding some...'),
      );
    } else {
      return   ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              
              id: favouriteMeals[index].id,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl,
              title: favouriteMeals[index].title);
        },
        itemCount: favouriteMeals.length,
      ) ;
    }
  }
}
