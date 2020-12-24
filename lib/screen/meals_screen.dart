import 'package:flutter/material.dart';
//import 'package:foodz/dummy.dart';
import '../widget/meal_item.dart';
//import '../main.dart';
import '../models/meals.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = "/meals";
  final List<Meal> availableMeals;
  // final String mealid;
  // final String mealtitle;
  // MealsScreen(this.mealid,this.mealtitle)
  // final List<Meal> availableMeals;
  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  String mealtitle;
  List<Meal> displayedMeals;
  var loadedinitData = false;
  void initState() {
  

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedinitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      mealtitle = routeArg['title'];
      final mealid = routeArg['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(mealid);
      }).toList();
      loadedinitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealtitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
             // removeItem: _removeMeal,
              id: displayedMeals[index].id,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title);
        },
        itemCount: displayedMeals.length,
      ),
      
    );
  }
}
