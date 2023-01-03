import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/Trip_item.dart';
class FavoriteScreen extends StatelessWidget {
    List<Trip> favoriteTrips;
    FavoriteScreen(this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
  if(favoriteTrips.isEmpty){return Center(
      child: Text('there is no favorite trips'));}
  else{
return
    ListView.builder(itemBuilder: (ctx,index){
      return TripItem(id: favoriteTrips![index].id,
        title: favoriteTrips![index].title,
        imageUrl: favoriteTrips![index].imageUrl,
        duration: favoriteTrips![index].duration,
        tripType: favoriteTrips![index].tripType,
        season:favoriteTrips ![index].season,
        );

    },
      itemCount:favoriteTrips!.length ,);
  }




  }
}
