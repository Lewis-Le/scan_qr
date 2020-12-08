import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  String code_result = "";
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
  String code_value;

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
    if(_name != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute(code_value: _name,)),
      );
    }
  }

  Future _add(){
    String test = "";
    test = "Complete";
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

class SecondRoute extends StatelessWidget{

  String code_value;
  SecondRoute({this.code_value});

  Future _add(){
    String test = "";
    test = "Complete";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hoàn tất quá trình nhập hàng"),
      ),

      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Nhập tên vào đây",
              labelText: "Tên mặt hàng",
              labelStyle: TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
              hintStyle: TextStyle(
                  color: Colors.grey
              ),
              border: OutlineInputBorder(),
              fillColor: Colors.cyan,
              filled: false
            ),
            keyboardType: TextInputType.name,
            maxLines: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Nhập xuất xứ sản phẩm",
                labelText: "Xuất xứ",
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Nhập loại sản phẩm vào đây",
                labelText: "Phân loại",
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Nhập số lượng sản phẩm tại đây",
                labelText: "Số lượng",
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.number,
            maxLines: 1,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Nhập giá tiền trên một đơn vị sản phẩm tại đây",
                labelText: "Giá tiền trên 1 sản phẩm",
                labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.number,
            maxLines: 1,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Mô tả về sản phẩm tại đây",
                labelText: "Mô tả",
                labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Ghi chú thêm cho sản phẩm tại đây",
                labelText: "Ghi chú",
                labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                ),
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                filled: false
            ),
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Mã code sản phẩm vừa quét", style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          )),
          SizedBox(
            height: 5,
          ),
          Text(code_value, style: TextStyle(
            fontSize: 24,
            color: Colors.grey,
          ),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _add,
      tooltip: 'Thêm sản phẩm',
      child: Icon(Icons.save, size: 20),
      ), //
      backgroundColor: Colors.white54,
    );
  }
}
