import 'package:ResturantsApp/ResurantApp/Modelclass/MealsModel.dart';

import 'package:ResturantsApp/ResurantApp/Routes/AdditionalFile/ListView.dart';
import 'package:flutter/material.dart';

class Categories_menu extends StatefulWidget {
  static const routename = "categories/Categories_name";
  final List<Meal> dummy_data;
  const Categories_menu(this.dummy_data);

  @override
  _Categories_menuState createState() => _Categories_menuState();
}

class _Categories_menuState extends State<Categories_menu> {
  List<Meal> meals;
  var routeAgrs;

  @override
  void didChangeDependencies() {
    routeAgrs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    meals = widget.dummy_data
        .where((e) => e.categories.contains(routeAgrs['id']))
        .toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeAgrs["title"]),
        backgroundColor: routeAgrs['color'],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: meals.length == 0
            ? Center(child: Text(" Sorry! no item is avaible "))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return view(meals[index], context);
                },
                itemCount: meals.length,
              ),
      ),
    );
  }
}
