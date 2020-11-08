

import 'package:ResturantsApp/ResurantApp/Modelclass/MealsModel.dart';
import 'package:ResturantsApp/ResurantApp/Modelclass/dummy_data%20.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  static const routename= "/categories_unit/description_page";
  final Function toggle;
  DescriptionPage( this.toggle);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  bool _changed;
  @override
  void initState() {
    _changed=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final String id=ModalRoute.of(context).settings.arguments as String;
    final Meal meal=DUMMY_MEALS.firstWhere((element) => element.id==id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: Colors.red[500],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(onPressed: (){
          widget.toggle(meal.id);
          setState((){
           _changed=!(_changed);
          });
          
        },
        
        child: Icon( Icons.favorite,size: 28,color: _changed==true?Colors.redAccent:Colors.white,),
        backgroundColor: _changed==true?Colors.white:Colors.red,
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
       ClipRRect(child: Image.network(meal.imageUrl,width:double.infinity,height:300,fit: BoxFit.cover,),borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),bottomRight:Radius.circular(10)
       ),
       ),
       SizedBox(height:20),
       Text("Ingredients",style: TextStyle(
         fontWeight: FontWeight.w700,fontSize: 25,
       ),),
      
       Card(
              
                    child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(4),
                    height:250,
                    child: ListView.builder(
                    itemCount: meal.ingredients.length
                    ,itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        
                        child: Text(meal.ingredients[index],style: TextStyle(
                          fontSize: 15
                        ),),
                        
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,borderRadius: BorderRadius.circular(5)
                        ),

                      ) ;
                  }),




                
             decoration: BoxDecoration(
               border: Border.all(width: 1,color: Colors.black38),
               borderRadius: BorderRadius.circular(8)
             ),
         
                ),
       ),
       SizedBox(height:20),
       Text("Steps",style: TextStyle(
         fontWeight: FontWeight.w700,fontSize: 25,
       ),),
      
       Card(
              
                                  child: Container(
                    margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(4),
                    height:300,
                    child: ListView.builder(
                    itemCount: meal.steps.length
                    ,itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                        
                        child: Row(
                                                  children:<Widget>[
                                                      CircleAvatar(
                                                       
                                                       child: Text("# ${index+1}"),
                                                       

                                                      ),
                                                      SizedBox(width:5),
                                                       Flexible(child: Text(meal.steps[index],style: TextStyle(fontSize: 15),)),

                                                  ]
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white60,borderRadius: BorderRadius.circular(5),
                        ),

                      ) ;
                  }),



             decoration: BoxDecoration(
               border: Border.all(width: 1,color: Colors.black38),
               borderRadius: BorderRadius.circular(8)
             ),

         
                ),
       ),
     SizedBox(height:20)
       ]  
       ),

       )
    );
  }
}