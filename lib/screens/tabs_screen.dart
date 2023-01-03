import 'dart:ffi';

import 'package:flutter/material.dart';
import '../screens/Favorite_screen.dart';
import '../screens/categories_screen.dart';
import '../widgets/app_drawer.dart';
import '../models/trip.dart';
class TabsScreen extends StatefulWidget {

  final List<Trip> favoriteTrips;
 TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {



    int _selectedItem=0;
   List<Map<String,Object>>? _screen;
 @override
  void initState() {
_screen   =[
  {"screen":CategoriesScreen(),
    "title":"التصنيفات"
  },
  {"screen":FavoriteScreen(widget.favoriteTrips),
    "title": "المفضلة"
  },
];super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(_screen![_selectedItem]["title"] as String),

      ),
      drawer:AppDrawer(),
      body:_screen![_selectedItem]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedItem,
        onTap:(int index)=>setState(() {
          _selectedItem =index;
        }),
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),
            label: "التصنيفات"),

        BottomNavigationBarItem(icon: Icon(Icons.star),
        label: "المفضلة")
      ],
      ),
    );
  }
}
