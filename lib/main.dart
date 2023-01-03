import 'package:flutter/material.dart';
import 'package:storyapp/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/Categories_trips_screen.dart';
import './screens/Trip_Detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filtered_screen.dart';
import './widgets/app_data.dart';
import './models/trip.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  
   
  @override
  State<MyApp> createState() => _MyAppState();
}
       List<Trip> _availableTrips=Trips_data;
      List<Trip> favoriteTrips=[];

class _MyAppState extends State<MyApp> {
  void updateFavorite(String TripId){
    var existanceIndex=favoriteTrips.indexWhere((trip) =>trip.id == TripId );
    if(existanceIndex>0){
     setState(() {
       favoriteTrips.removeAt(existanceIndex);
     });
    }else{
      setState(() {
        favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id==TripId))
        ;});

    }

  }

  bool? isFavorite(tripId){

      return

         favoriteTrips.any((trip) => trip.id == tripId);

    }

  



  Map<String,bool> _filters={
    "summer":false,
    "winter":false,
    "family":false,
  };
  void _changeFilters(Map<String,bool> filtersData){
  setState(() {
    _filters=filtersData;
    _availableTrips=Trips_data.where((trip) {
      if(_filters['summer']==true && trip.isInSummer !=true){ return false;}
      if(_filters['winter']==true && trip.isInWinter !=true){return false;}
      if(_filters['family']==true && trip.isForFamilies !=true){return false;}
      return true;
    }).toList();
  });
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: ("travel app"),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // English, no country code
        ],
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: "ElMessiri",
          textTheme: ThemeData.light().textTheme.copyWith(

            headline5: TextStyle(
              fontFamily: "ElMessiri",
              color: Colors.yellow,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
              headline6: TextStyle(
                fontFamily: "ElMessiri",
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )
          )


        ),

        routes:{
          "/":(ctx) =>TabsScreen(favoriteTrips),
          CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(_availableTrips),
          TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(updateFavorite,isFavorite),
          FilteredScreen.screenRoute:(ctx) =>FilteredScreen(_filters,_changeFilters),
        }

      );

  }
}
