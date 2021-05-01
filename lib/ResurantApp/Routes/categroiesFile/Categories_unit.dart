import 'package:flutter/material.dart';

import 'Categories_menu.dart';

class Categories_unit extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const Categories_unit({this.id, this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [color, color.withOpacity(.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Colors.black),
              ),
            )),
        onTap: () => {
          Navigator.of(context).pushNamed(Categories_menu.routename,
              arguments: {"title": title, "id": id, "color": color})
        },
      ),
    );
  }
}
