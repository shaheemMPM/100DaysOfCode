import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realtime Database',
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

  final _inputController = TextEditingController();

  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Time Database')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                    hintText: "Input String",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)
                ),
              ),
            ),
            RaisedButton(
              color: Colors.red,
              padding: EdgeInsets.all(10.0),
              child: Text('Upload', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: (){
                writeData();
              },
            ),
            RaisedButton(
              color: Colors.blueAccent,
              padding: EdgeInsets.all(10.0),
              child: Text('Download', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: (){
                readData();
              },
            ),
            RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.all(10.0),
              child: Text('Update', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: (){
                updateData();
              },
            ),
            RaisedButton(
              color: Colors.black,
              padding: EdgeInsets.all(10.0),
              child: Text('Delete', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: (){
                deleteData();
              },
            )
          ],
        ),
      ),
    );
  }

  void writeData() {
//    String stamp = new DateTime.now().millisecondsSinceEpoch.toString();
    dbRef.child("key").set({
      'body': _inputController.text
    });
  }

  void readData() {
    dbRef.once().then((DataSnapshot dataSnapShot){
      print(dataSnapShot.value);
    });
  }

  void updateData() {
    dbRef.child('key').update({
      'body': 'Updated Value'
    });
  }

  void deleteData() {
    dbRef.child('key').remove();
  }
}
