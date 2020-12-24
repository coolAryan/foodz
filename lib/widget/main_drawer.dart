import 'package:flutter/material.dart';
import '../screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildList(String name, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            // decoration: BoxDecoration(),
            child: Text(
              'Cooking Up!..',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildList('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, "/");
          }),
          buildList('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, Filter.routeName);
          }),
        ],
      ),
    );
  }
}
