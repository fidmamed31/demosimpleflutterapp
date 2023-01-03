import 'package:flutter/material.dart';
import 'package:storyapp/screens/categories_screen.dart';
import 'Favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('دليل سياحي'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "المفضلة",
                icon: Icon(Icons.dashboard),
              ),
              Tab(
                text: "تصنيفات",
                icon: Icon(Icons.star),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            CategoriesScreen(),
            //FavoriteScreen(),
          ],
        ),

      ),
    );
  }
}
