
import 'package:ResturantsApp/ResurantApp/Home.dart';
import 'package:ResturantsApp/ResurantApp/Routes/Filter.dart';
import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 30),
          child: Center(child: Text("Cooking Up !",style: TextStyle(
            fontSize: 26,fontWeight: FontWeight.w700,color: Colors.brown
          ),)),
          decoration: BoxDecoration(
            color: Colors.orangeAccent
          ),
          ),
          buildList("Meals", Icons.restaurant,()=>{
            Navigator.of(context).pushReplacementNamed(TabBars.routename)
          }),
          SizedBox(height: 10,),
          buildList("Filter", Icons.settings,()=>{
            Navigator.of(context).pushReplacementNamed(Filter.routename)
          })
        ],
      ),
    );
  }
}
Widget buildList(String title,IconData icon,Function changeState)
{
  return ListTile
  (
      leading:Icon( icon), 
      title: Text(title,style: TextStyle(
       fontSize: 20
      ),),
      onTap:
        changeState
  );
}