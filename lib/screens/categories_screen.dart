import 'package:flutter/material.dart';
import '../widgets/app_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children:
          Categories_data.map((e) => CategoryItems(e.imageUrl, e.title,e.id),).toList(),
    );
        

  }
}
