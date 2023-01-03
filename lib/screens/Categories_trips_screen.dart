
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/Trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {


static const screenRoute="/categoryTrip";
    List<Trip> _availableTrips;
    CategoryTripsScreen(this._availableTrips);
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {

  String? categoryTitle;
  List<Trip>? displayTrips;

  @override
  void initState() {
    super.initState();
  }
@override
  void didChangeDependencies() {
  final arguments=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
  categoryTitle=arguments["title"];
  final String? id=arguments["id"];
  displayTrips=widget._availableTrips.where((trip) =>trip.categories.contains(id)).toList();
  print(displayTrips?.length);
  super.didChangeDependencies();
  }


  void setFavory(String tripid){
    setState(() {
      displayTrips!.removeWhere((trip) =>trip.id == tripid);
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
       body: ListView.builder(itemBuilder: (ctx,index){
         return TripItem(id: displayTrips![index].id,
             title: displayTrips![index].title,
             imageUrl: displayTrips![index].imageUrl,
             duration: displayTrips![index].duration,
             tripType: displayTrips![index].tripType,
             season: displayTrips![index].season,
        );

       },
       itemCount:displayTrips!.length ,)


    );
  }
}

