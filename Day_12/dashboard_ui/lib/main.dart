import 'package:flutter/material.dart';
import 'grid_dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selected = 'dark';
  var bgColor = 0xFF3B204E; //0xFFFFFFFF
  var h1Color = 0xFFFFFFFF; //0xFF09111A
  var h6Color = 0xFFA29AAC; //0xFF85858E

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(bgColor),
      body: Column(
        children: <Widget>[
          SizedBox(height: 110.0),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Johny\'s Family',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color(h1Color)
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text('Home',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Color(h6Color)
                      ),
                    )
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(Icons.brush, color: Color(h1Color)),
                  onPressed: (){
                    changeThem();
                  },
                )
              ],
            )
          ),
          SizedBox(height: 40.0),
          GridDashboard()
        ],
      ),
    );
  }

  changeThem(){
    if (selected == 'dark') {
      setState(() {
        selected = 'light';
        bgColor = 0xFFFFFFFF;
      });
    }else {
      setState(() {
        selected = 'dark';
        bgColor = 0xFF392850;
      });
    }
  }

}