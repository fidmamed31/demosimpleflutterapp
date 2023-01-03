import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/Trip_Detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

const   TripItem({required this.id, required this.title, required this.imageUrl, required this.duration,
    required this.tripType, required this.season,});

  String get seasontext{
    switch (season){
      case Season.Autumn:
        return "خريف";
            break;
      case Season.Winter:
        return "شتاء";
        break;
      case Season.Spring:
        return "ربيع";
        break;
      case Season.Summer:
        return "صيف";
        break;
      default:
        return "غير معروف";
     }


  }

  String get TripTypeText{
    switch (tripType){
      case TripType.Exploration:
        return "استكشاف";
        break;
      case TripType.Activities:
        return "أنشطة";
        break;
      case TripType.Recovery:
        return "استعادة";
        break;
      case TripType.Therapy:
        return "مُعَالَجَة";
        break;
      default:
        return "غير معروف";
    }


  }
  void selectTrip(BuildContext context){
    Navigator.of(context).pushNamed(
        TripDetailScreen.screenRoute,
      arguments: id!

    );

  }


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:()=> selectTrip(context),
      child: Card(
        margin: EdgeInsets.all(14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
       elevation: 7,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)
                  ),

                    child: Image.network( imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover,)
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  width: double.infinity,
                    height: 250,
                    child: Text( title,

                      style:Theme.of(context).textTheme.headline6,
                    overflow:TextOverflow.fade,
                    ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0) ,Colors.black.withOpacity(0.8) ],
                    stops: [0.6,1]
                  )
                ),)



              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [Icon(Icons.today, color:Theme.of(context).accentColor,),SizedBox(width: 6,) ,Text('$duration ايام ')],),
                  Row(children: [Icon(Icons.wb_sunny,color:Theme.of(context).accentColor,),SizedBox(width: 6,) ,Text(seasontext)],),
                  Row(children: [Icon(Icons.family_restroom,color:Theme.of(context).accentColor,),SizedBox(width: 6,) ,Text(TripTypeText)],),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

