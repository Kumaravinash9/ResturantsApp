


import 'package:ResturantsApp/ResurantApp/Modelclass/dummy_data%20.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Categories_unit.dart';

class Categories extends StatelessWidget 
{
   @override
   Widget build(BuildContext context) 
   {
    return GridView(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 3/2,maxCrossAxisExtent: 200,crossAxisSpacing: 20,mainAxisSpacing: 20,
    ),children: DUMMY_CATEGORIES.map((e) => Categories_unit(id:e.id,title:e.title,color:e.color)).toList(),);
   }
}

