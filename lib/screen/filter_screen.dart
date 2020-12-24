import 'package:flutter/material.dart';
import 'package:foodz/widget/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = "/filter";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  Filter(this.currentFilters, this.saveFilters);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _lactosefree = false;
  bool _vegan = false;
  @override
  void initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitch(bool val, Function handler, Widget tx, Widget st) {
    return SwitchListTile(
      value: val,
      onChanged: handler,
      title: tx,
      subtitle: st,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch(
                  _glutenfree,
                  (newVal) {
                    setState(
                      () {
                        _glutenfree = newVal;
                      },
                    );
                  },
                  Text('Gluten-free'),
                  Text('Only include gluten free meals'),
                ),
                buildSwitch(
                  _vegetarian,
                  (newVal) {
                    setState(
                      () {
                        _vegetarian = newVal;
                      },
                    );
                  },
                  Text('Vegetarian'),
                  Text('Only include Veg meals'),
                ),
                buildSwitch(
                  _vegan,
                  (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                  Text('Vegan'),
                  Text('Only include Vegan meals'),
                ),
                buildSwitch(
                  _lactosefree,
                  (newVal) {
                    setState(() {
                      _lactosefree = newVal;
                    });
                  },
                  Text('Lactose-free'),
                  Text('Only include Lactose free meals'),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
