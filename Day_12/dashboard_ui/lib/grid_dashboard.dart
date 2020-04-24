import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {

  final shadowColor;
  final boxColor;
  final h1Color;
  final h6Color;
  final h4Color;

  GridDashboard({this.shadowColor, this.boxColor, this.h1Color, this.h6Color, this.h4Color});

  final Item item1 = new Item(
    title: "Calendar",
    subtitle: "March, Wednesday",
    event: "3 Events",
    img: "assets/images/calendar.png"
  );
  final Item item2 = new Item(
    title: "Groceries",
    subtitle: "Brocoli, Apple",
    event: "4 Items",
    img: "assets/images/food.png"
  );
  final Item item3 = new Item(
    title: "Location",
    subtitle: "Going to college",
    event: "",
    img: "assets/images/map.png"
  );
  final Item item4 = new Item(
    title: "Activity",
    subtitle: "Negin wrote poem",
    event: "",
    img: "assets/images/festival.png"
  );
  final Item item5 = new Item(
    title: "To Do",
    subtitle: "Study Compilers",
    event: "9 Items",
    img: "assets/images/todo.png"
  );
  final Item item6 = new Item(
    title: "Settings",
    subtitle: "March, Wednesday",
    event: "3 Events",
    img: "assets/images/setting.png"
  );

  @override
  Widget build(BuildContext context) {

    List<Item> myList = [item1, item2, item3, item4, item5, item6];

    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 18.0,
        mainAxisSpacing: 18.0,
        children: myList.map((data){
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(shadowColor),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    10.0, // Move to right 10  horizontally
                    10.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              color: Color(boxColor),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.img, width: 42.0),
                SizedBox(height: 14.0),
                Text(data.title,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Color(h1Color),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 8.0),
                Text(data.subtitle,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Color(h6Color),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 14.0),
                Text(data.event,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Color(h4Color),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          );
        }).toList()
      ),
    );
  }
}

class Item {
  String title;
  String subtitle;
  String event;
  String img;
  Item({this.title, this.subtitle, this.event, this.img});
}