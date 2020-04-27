import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'puzzle_component',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var options = [];
  String ansString = 'DELHI';
  final _random = new Random();
  var answer = [];
  var entering = [];
  var filled = 0;

  fillAnswer(cha, ind) {
    if (filled < entering.length) {
      if (answer[filled] == cha) {
        setState(() {
          entering[filled] = cha;
          options[ind] = '';
          filled++;
        });
        print("Correct Character");
        if (filled == entering.length - 1) {
          print("Hurray Done");
        }
      } else {
        print("Wrong character");
      }
    }
  }

  List shuffle(List items) {
    for (var i = items.length - 1; i > 0; i--) {
      var n = _random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < ansString.length; i++) {
      answer.add(ansString[i]);
      options.add(ansString[i]);
      entering.add('');
    }
    for (var i = ansString.length; i < 12; i++) {
      var temp = 65 + _random.nextInt(90 - 65);
      options.add(String.fromCharCode(temp));
    }
    options = shuffle(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(children: [
          Flexible(
            child: GridView.count(
                childAspectRatio: 1.0,
                padding: EdgeInsets.all(16.0),
                crossAxisCount: 6,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: entering.map((opt) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                      child: Text(
                        opt,
                        style: TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                    ),
                  );
                }).toList()),
          ),
          Flexible(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.all(15.0),
              crossAxisCount: 6,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: options.asMap().map((i, opt) => MapEntry(
                i, GestureDetector(
                  onTap: () {
                    fillAnswer(opt, i);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                      child: Text(
                        opt,
                        style:
                            TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                    ),
                  ),
                )
              )).values.toList()
            )
          ),
        ]));
  }
}

// class Option {
//   int index;
//   String character;
// }