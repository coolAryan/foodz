import 'package:flutter/material.dart';
import 'package:foodz/dummy.dart';
import 'package:foodz/screen/filter_screen.dart';
//import 'screen/Categories_screen.dart';
import 'screen/meals_screen.dart';
import 'screen/meal_detail.dart';
import './screen/tabs_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _favMeals = [];
  List<Meal> _availmeal = DUMMY_MEALS;
  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availmeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        } else if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        } else if (_filters['vegan'] && !meal.isVegetarian) {
          return false;
        } else if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favMeals.indexWhere((meal) => mealId == meal.id);
    if (existingIndex >= 0) {
      setState(() {
      _favMeals.removeAt(existingIndex);  
      });}
    
      else{
        setState(() {
          _favMeals.add(DUMMY_MEALS.firstWhere((meal) =>  mealId == meal.id   ));
        });
      }
      
    }

    bool _isMealFav(String id){
      return _favMeals.any((meal) =>id==meal.id );
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreen(_favMeals),
        MealDetail.routeName: (context) => MealDetail(_toggleFav,_isMealFav),
        MealsScreen.routeName: (context) => MealsScreen(_availmeal),
        Filter.routeName: (context) => Filter(_filters, _setfilters),
      },
      //  onUnknownRoute: ,
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //    );
      // },

      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.cyanAccent,
        canvasColor: Color.fromRGBO(2550, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
            ),
      ),
    );
  }
}
