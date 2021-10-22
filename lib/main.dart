import 'package:ResturantsApp/ResurantApp/Modelclass/dummy_data%20.dart';
import 'package:ResturantsApp/ResurantApp/Routes/Filter.dart';
import 'package:ResturantsApp/ResurantApp/Routes/categroiesFile/Categories_menu.dart';
import 'package:ResturantsApp/ResurantApp/Routes/AdditionalFile/Description_page.dart';
import 'package:flutter/material.dart';
import 'ResurantApp/Home.dart';
import 'ResurantApp/Modelclass/MealsModel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> favourite = [];
  void toggle(String val) {
    var exisiting = favourite.indexWhere((element) => element == val);
    if (exisiting >= 0)
      setState(() {
        favourite.removeAt(exisiting);
      });
    else {
      setState(() {
        favourite.add(val);
      });
    }
  }

  List<Meal> dummy_data;
  @override
  void initState() {
    dummy_data = DUMMY_MEALS;
    super.initState();
  }

  Map<String, bool> filter = {
    "gluten_free": false,
    "lutcose_free": false,
    "isVegetarian": false,
    "vegan": false,
  };

  void filter_fun(Map<String, bool> filterData) {
    setState(() {
      filter = filterData;
      dummy_data = DUMMY_MEALS.where((element) {
        if (element.isGlutenFree && filter["gluten_free"]) return true;
        if (element.isLactoseFree && filter["lutcose_free"]) return true;
        if (element.isVegetarian && filter["isVegetarian"]) return true;
        if (element.isVegan && filter["vegas"]) return true;
        return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            splashColor: Colors.cyan,
            errorColor: Colors.cyanAccent,
            primaryColor: Colors.blue,
            fontFamily: "Vollkorn"),
        initialRoute: '/',
        routes: {
          TabBars.routename: (context) => TabBars(favourite),
          Categories_menu.routename: (context) => Categories_menu(dummy_data),
          Filter.routename: (context) => Filter(filter, filter_fun),
          DescriptionPage.routename: (context) => DescriptionPage(toggle),
        });
  }
}
