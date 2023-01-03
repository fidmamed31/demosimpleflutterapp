import 'package:flutter/material.dart';
import '../screens/filtered_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(top: 40),
            child: Text("دليلك السياحي",style: Theme.of(context).textTheme.headline6,),
          )
,          SizedBox(height: 20,),
          buildListTile('الرحلات',Icons.card_travel, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("صفحة الفلترة", Icons.filter_list, () {
       Navigator.of(context).pushReplacementNamed(FilteredScreen.screenRoute);
          })
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
          title: Text(title,style: TextStyle(
            fontFamily: "ElMessiri",fontSize: 24,fontWeight: FontWeight.bold
          ),),
          leading: Icon(icon, size: 30,color: Colors.blue,) ,
          onTap:onTapLink ,

        );
  }
}
