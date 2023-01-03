import 'package:flutter/material.dart';
import '../screens/Categories_trips_screen.dart';
class CategoryItems extends StatelessWidget {

  final String id;
  final String imageUrl;
   final String title;

   CategoryItems(this.imageUrl,this.title, this.id);
  void SelectedCategoty(ctx){
    
    Navigator.of(ctx).pushNamed(
      CategoryTripsScreen.screenRoute,
        arguments: {
        "id": id,
      "title": title,
      "imageUrl":imageUrl,}
   );
  }
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => SelectedCategoty(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl,

            height: 250,
            fit: BoxFit.cover,),
          ),

          Container(

            padding: EdgeInsets.all(10),
           child: Center(child: Text(title,
           style:Theme.of(context).textTheme.headline6
           )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4), //dirha dakhil decoration
            ),

)
        ],
      ),
    );
  }
}
