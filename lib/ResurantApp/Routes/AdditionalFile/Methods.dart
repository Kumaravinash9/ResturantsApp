

import 'package:ResturantsApp/ResurantApp/Modelclass/MealsModel.dart';
import 'package:flutter/cupertino.dart';

String affordability(Affordability affordability) 
{
     switch (affordability) {
     case Affordability.Luxurious : return "Luxurious";
     case  Affordability.Pricey: return "Pricey";
     case Affordability.Affordable: return "Affordable";
     default: return 'Unknown';
}}
           
String complexity(Complexity complexity) 
{
switch (complexity) {
     case Complexity.Simple : return "Simple";
     case  Complexity.Challenging: return "Challenging";
     case Complexity.Hard: return "Hard";
     default: return 'Unknown';
   }
}


Widget unit(String value,IconData icon,)
{
return  Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Icon(icon,size: 18,),
        Text(value,style: TextStyle(
            fontSize: 14,fontWeight: FontWeight.w600
          ),)
        ],
      );
}