import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';
import './fav.dart';
import './Categories_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _pageIndex = 0;

  @override
  void initState() {
    _pages=[
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': Favourite(widget._favouriteMeals), 'title': 'Favourite'}
  ];
   
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title']),
      ),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
