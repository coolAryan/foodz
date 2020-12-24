import 'package:flutter/material.dart';
import '../dummy.dart';
import '../widget/Categaory_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Deli Meals'),
      // ),
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
