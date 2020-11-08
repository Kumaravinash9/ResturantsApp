
import 'package:ResturantsApp/ResurantApp/Routes/Favourite.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Routes/AdditionalFile/Drawer.dart';
import 'Routes/categroiesFile/Categories.dart';

class TabBars extends StatefulWidget {
 static const routename="/";
  final List<String> favourite;

  const TabBars(this.favourite);
  @override
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
     length: 2,initialIndex: 0,
     child: Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.deepPurple,
         title: Text("ResturantApp"),
         
         centerTitle: false,
          
         bottom: TabBar(
           labelColor: Colors.white,
           unselectedLabelColor: Colors.white,
           indicatorColor: Colors.blue,
           tabs: 
           [
          Tab(
         icon:Icon(Icons.category_rounded),text: 'Categories',),
         Tab(icon: Icon(FontAwesomeIcons.star),text:"Favourite"),
         ],
         ),
         ),
         drawer: DrawerItems( ),
         body: TabBarView(
           
           children: [
           Categories(),
           Favourite( widget.favourite)
         ])
       ),
       

     );
    
  }
}
