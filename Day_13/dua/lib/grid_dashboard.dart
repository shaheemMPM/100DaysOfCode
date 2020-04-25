import 'package:flutter/material.dart';
import 'haddad.dart';

class GridDashboard extends StatelessWidget {

  final shadowColor;
  final boxColor;
  final h1Color;
  final h6Color;
  final h4Color;
  final bgColor;

  GridDashboard({
    this.shadowColor, 
    this.boxColor, 
    this.h1Color, 
    this.h6Color, 
    this.h4Color, 
    this.bgColor
  });

  final Item item2 = new Item(
    title: "Groceries",
    img: "assets/images/img7.png"
  );
  final Item item3 = new Item(
    title: "Manqoos Moulid",
    img: "assets/images/img3.png"
  );
  final Item item4 = new Item(
    title: "Activity",
    img: "assets/images/img4.png"
  );
  final Item item5 = new Item(
    title: "To Do",
    img: "assets/images/img5.png"
  );
  final Item item6 = new Item(
    title: "Settings",
    img: "assets/images/img6.png"
  );

  @override
  Widget build(BuildContext context) {

    // List<Item> myList = [item2, item3, item4, item5, item6];

    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 18.0,
        mainAxisSpacing: 18.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HaddadPage(bgColor: bgColor)
              ));
            },
            child: Container(
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
                  Image.asset("assets/images/img1.png", width: 60.0),
                  SizedBox(height: 14.0),
                  Text("Hadhadh",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Color(h1Color),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                Image.asset("assets/images/img7.png", width: 60.0),
                SizedBox(height: 14.0),
                Text("Manqoos Moulid",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Color(h1Color),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Item {
  String title;
  String img;
  Item({this.title, this.img});
}