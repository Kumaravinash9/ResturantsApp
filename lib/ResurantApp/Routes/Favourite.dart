import 'package:ResturantsApp/ResurantApp/Modelclass/MealsModel.dart';
import 'package:ResturantsApp/ResurantApp/Modelclass/dummy_data%20.dart';
import 'package:flutter/material.dart';

import 'AdditionalFile/ListView.dart';

class Favourite extends StatefulWidget {
  static const routename = "/favourite";
  List<String> favourite;
  Favourite(this.favourite);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Meal> data = [];
  @override
  void initState() {
    data = DUMMY_MEALS.where((element) {
      if (widget.favourite.contains(element.id)) return true;
      return false;
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: data.length == 0
          ? Center(child: Text(" Sorry! no item is avaible "))
          : ListView.builder(
              itemBuilder: (context, index) {
                return view(data[index], context);
              },
              itemCount: data.length,
            ),
    );
  }
}
