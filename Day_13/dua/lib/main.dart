import 'package:flutter/material.dart';
import 'grid_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  var selected = 'light';
  var bgColor = 0xFFFFFFFF;
  var h1Color = 0xFF09111A;
  var h6Color = 0xFF85858E;
  var shadowColor = 0xFFBFBFBF;
  var boxColor = 0xFFFFFFFF;
  var h4Color = 0xFF5A7ED1;

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString(key);
    if (temp != null) {
      if (temp == 'light') {
        setState(() {
          selected = 'light';
          bgColor = 0xFFFFFFFF;
          h1Color = 0xFF09111A;
          h6Color = 0xFF85858E;
          shadowColor = 0xFFBFBFBF;
          boxColor = 0xFFFFFFFF;
          h4Color = 0xFF5A7ED1;
        });
      } else {
        setState(() {
          selected = 'dark';
          bgColor = 0xFF3B204E;
          h1Color = 0xFFFFFFFF;
          h6Color = 0xFFA29AAC;
          shadowColor = 0xFF2E153F;
          boxColor = 0xFF452f53;
          h4Color = 0xFFBCBCBC;
        });
      }
    }
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  void initState() {
    super.initState();
    read('themedata');
  }

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
                    Text('Islamic Duas',
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
                  icon: Icon(Icons.invert_colors, color: Color(h1Color)),
                  onPressed: (){
                    changeThem();
                  },
                )
              ],
            )
          ),
          SizedBox(height: 40.0),
          GridDashboard(
            shadowColor: shadowColor, 
            boxColor: boxColor,
            h1Color: h1Color,
            h6Color: h6Color,
            h4Color: h4Color,
            bgColor: bgColor,
          )
        ],
      ),
    );
  }

  changeThem(){
    if (selected == 'dark') {
      save('themedata', 'light');
      setState(() {
        selected = 'light';
        bgColor = 0xFFFFFFFF;
        h1Color = 0xFF09111A;
        h6Color = 0xFF85858E;
        shadowColor = 0xFFBFBFBF;
        boxColor = 0xFFFFFFFF;
        h4Color = 0xFF5A7ED1;
      });
    }else {
      save('themedata', 'dark');
      setState(() {
        selected = 'dark';
        bgColor = 0xFF392850;
        h1Color = 0xFFFFFFFF;
        h6Color = 0xFFA29AAC;
        shadowColor = 0xFF2E153F;
        boxColor = 0xFF452f53;
        h4Color = 0xFFBCBCBC;
      });
    }
  }

}