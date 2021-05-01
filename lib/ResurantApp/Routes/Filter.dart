import 'package:flutter/material.dart';
import '../Home.dart';
import 'AdditionalFile/Drawer.dart';

class Filter extends StatefulWidget {
  static const routename = "/filter";
  final Function filter_fun;
  final Map<String, bool> filter;
  const Filter(this.filter, this.filter_fun);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool gluten_free;
  bool lactose_free;
  bool vegetarian;
  bool vegan;
  @override
  void initState() {
    gluten_free = widget.filter["gluten_free"];
    lactose_free = widget.filter["lutcose_free"];
    vegetarian = widget.filter["isVegetarian"];
    vegan = widget.filter["vegas"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        centerTitle: false,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.filter_fun({
                  "gluten_free": gluten_free,
                  "lutcose_free": lactose_free,
                  "isVegetarian": vegetarian,
                  "vegas": vegan,
                });

                Navigator.of(context).pushNamed(TabBars.routename);
              })
        ],
      ),
      drawer: DrawerItems(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15),
          Text(
            "Adjust your meal Selection",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          SwitchListTile(
            value: vegetarian,
            onChanged: (newValue) {
              setState(() {
                vegetarian = newValue;
              });
            },
            title: Text(
              "Vegetarian",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            subtitle:
                Text("Only include " + "Vegetarian".toLowerCase() + " meals."),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 2,
                thickness: 1.2,
              )),
          SwitchListTile(
            value: vegan,
            onChanged: (newValue) {
              setState(() {
                vegan = newValue;
              });
            },
            title: Text(
              "Vegan",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            subtitle: Text("Only include " + "Vegan".toLowerCase() + " meals."),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 2,
              thickness: 1.2,
            ),
          ),
          SwitchListTile(
            value: lactose_free,
            onChanged: (newValue) {
              setState(() {
                lactose_free = newValue;
              });
            },
            title: Text(
              "Lactose-Free",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            subtitle: Text(
                "Only include " + "Lactose-Free".toLowerCase() + " meals."),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 2,
              thickness: 1.2,
            ),
          ),
          SwitchListTile(
            value: gluten_free,
            onChanged: (newValue) {
              setState(() {
                gluten_free = newValue;
              });
            },
            title: Text(
              "Gluten-Free",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            subtitle:
                Text("Only include " + "Gluten-Free".toLowerCase() + " meals."),
          ),
        ],
      ),
    );
  }
}
