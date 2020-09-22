import 'package:flutter/material.dart';

import '../dummy_dart.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      //Scaffold is not required as that is now controlled by Tabs SCreen.
      padding: EdgeInsets.all(25),
      children:
          DUMMY_CATEGORIES //Uses Dummy Data and maps it to return a widget of Category Item.
              .map((catData) => CategoryItem(
                    catData.id,
                    //We pass the title and data to the widget.
                    catData.color,
                    catData.title,
                  ))
              .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
