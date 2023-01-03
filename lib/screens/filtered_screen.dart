import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
class FilteredScreen extends StatefulWidget {
  static const   screenRoute="NavigationRoutee";
  @override
  State<FilteredScreen> createState() => _FilteredScreenState();

  final void Function(Map<String,bool>)? _saveChanges;
  Map<String,bool> _currentFilters;
  FilteredScreen(this._currentFilters,this._saveChanges);
}

class _FilteredScreenState extends State<FilteredScreen> {

   bool _isSummer=false;
  bool _isWinter=false;
  bool _isForFamilies=false;

  @override
  void initState() {
    _isSummer=widget._currentFilters["summer"]!;
    _isWinter=widget._currentFilters["winter"]!;
    _isForFamilies=widget._currentFilters["family"]!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
      actions: [
        IconButton(onPressed: (){
            widget._saveChanges!({
              "summer": _isSummer,
              "winter": _isWinter,
              "family": _isForFamilies,
            });
          },
            icon: Icon(Icons.save))
      ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Expanded(child: ListView(
            children: [
             buildSwitchListTile("الرحلات الصيفية فقط", "تننتسيبلنتيسنتي", _isSummer, (p0) { setState(() {
               _isSummer=p0 ;
             }); })     ,
             buildSwitchListTile("الرحلات الشتوية فقط", "نتليسنتلينتيس",_isWinter, (p0) { setState(() {
               _isWinter=p0;
             }); }) ,
              buildSwitchListTile("للعائلات فقط", "نلنتيسنتيسنتيس", _isForFamilies, (p0) { setState(() {
                _isForFamilies=p0;
              }); })
            ],
          )
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentValue, void Function(bool)?  setUpdates
      ) => SwitchListTile(value: currentValue, onChanged: setUpdates,title:Text(title) ,subtitle:Text(subtitle) ,);
}
