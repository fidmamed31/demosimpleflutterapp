import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/app_data.dart';
import '../models/trip.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute="/TripDetailScreen";

  final Function updateFavorite;
  final Function isFavorite;

    TripDetailScreen(this.updateFavorite,this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final TripId=ModalRoute.of(context)?.settings.arguments as String;
    final Tripy=Trips_data.firstWhere((trip) => trip.id== TripId)    ;
    final imageUrl=Tripy.imageUrl;
    final activities=Tripy.activities;
    final program=Tripy.program;


    return Scaffold(
      appBar:AppBar(
          title: Text(Tripy.title)) ,
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              height:250,
              width: double.infinity,
              child: Image.network(imageUrl,fit: BoxFit.cover,),
            ),
            buildSection(context,'الانشطة '),
            buildContainerListView(ListView.builder(itemBuilder:(ctx,index)=> Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                child: Text(Tripy.activities[index]),
              ),


            ) ,itemCount: Tripy.activities.length,)),
            SizedBox(
              height: 10,
            ),
            buildSection(context,'البرنامج '),
            buildContainerListView(
              ListView.builder(itemBuilder: (context,index)=>Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(" ${index + 1}يوم"),

                    ),
                    title: Text(
                      Tripy.program[index]
                    ),
                  ),
                  Divider()
                ],
              ),
                itemCount: Tripy.program.length,)


            )



,
        SizedBox(
          height: 100,
        ),

          ],




        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
             isFavorite(TripId) ?Icons.star: Icons.star_border),
        onPressed: (){

          updateFavorite(TripId);
        },
      ),
    );
  }

  Container buildContainerListView(Widget child) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)

          ),
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical:5 ,horizontal: 10),
          child: child

          );
  }

  Container buildSection(BuildContext context,String title ) {
    return Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.symmetric(horizontal:15 ,vertical: 10),
          child: Text(title, style:Theme.of(context).textTheme.headline5),
        );
  }
}
