


import 'dart:ui';
import 'package:ResturantsApp/ResurantApp/Modelclass/MealsModel.dart';

import 'package:flutter/material.dart';
import './Description_page.dart';
import 'Methods.dart';

Widget view(Meal meal, BuildContext context) 
 {

return   Card(
  
  shape: RoundedRectangleBorder(
  
  borderRadius: BorderRadius.circular(10),
  
  ),
  
  elevation: 10,
  
  child: InkWell(
      child: Stack(
      children:<Widget> [
      Container(
      width: double.infinity,
      height: 300,
      child: Column(
      children:<Widget> [
      ClipRRect(
    
            borderRadius: BorderRadius.only(
    
            topLeft: Radius.circular(10),
    
            topRight: Radius.circular(10),
  
            ),
    
            child: Image.network(meal.imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,)
    
          ),
    
        
    
        Padding(
    
          padding: const EdgeInsets.all(10.0),
    
          child: Row(
    
            crossAxisAlignment: CrossAxisAlignment.center,
    
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    
          children: [
    
                  unit(meal.duration.toString()+"min",Icons.schedule),
    
                  unit(complexity(meal.complexity).toString(),Icons.shop),
    
                  unit(affordability(meal.affordability),Icons.attach_money) ], )  )],),),
    
                                     Positioned
                                      (   child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.black.withOpacity(.6),),
                                          padding: EdgeInsets.symmetric(horizontal:30,vertical: 10),
                                          child: Text(meal.title,overflow: TextOverflow.fade,softWrap: true,style: TextStyle(
                                          fontSize: 18,letterSpacing: .4,fontWeight: FontWeight.w500,color: Colors.white),)),
                                          right: 18,bottom: 110
                                      )
                                     ],),
                                     onTap: ()=>{
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DescriptionPage(id:meal.id)
                                      Navigator.of(context).pushNamed(DescriptionPage.routename,arguments:meal.id)
                                     

                                      


                                     },
                                     
                                     
                                     
                                     ),);}





