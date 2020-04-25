import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class HaddadPage extends StatefulWidget {

  final bgColor;

  HaddadPage({this.bgColor});

  @override
  _HaddadPageState createState() => _HaddadPageState();
}

class _HaddadPageState extends State<HaddadPage> {

  var appBarColor = 0xFFFF0000;
  String pdfAsset = "assets/other/haddaad.pdf";
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPDF();
  }

  _initPDF() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfAsset);
    setState(() {
      _doc = doc;
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(appBarColor),
        ),
        backgroundColor: Color(widget.bgColor),
        elevation: 0.0,
        title: Text(
          'راتب الحداد',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Markazi',
            fontSize: 30.0,
            color: Color(appBarColor)
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
            color: Color(appBarColor),
          )
        ],
      ),
      // backgroundColor: Color(widget.bgColor),
      backgroundColor: Colors.white,
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) :
      PDFViewer(
        document: _doc,
      )
    );
  }
}