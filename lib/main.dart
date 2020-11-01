import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scan',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Nhập hàng bằng mã QR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Khai báo biến ở đây
  String result = "";
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  String _name = "";

  @override
  void initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  /*void _incrementCounter() {
    setState(() {
    });
  }*/

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
    _name = this._outputController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[

          //Phần hiển thị kết quả scan
          new Text("\n  Kết quả quét mã: ", style: new TextStyle(fontSize: 18.0)),
          new TextField(
            controller: this._outputController,
            readOnly: true,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Result here!',
              hintStyle: TextStyle(fontSize: 30.0),
              contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15)
            )
          ),
        ],
      ),

      //Button để bật camera lên scan
      floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'Nhấn vào đây để quét mã',
        child: Icon(Icons.camera),
      ), //
    );
  }
}
