import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fu婆婆',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Fu婆婆'),
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
  String _yubabaText = "契約書だよ。\nそこに名前を書きな。";

  var _nameController = TextEditingController();

  String _zeitaku(String name) {
    print("name=$name");
    if (name == null && name.isEmpty) {
      return "";
    }

    final rand = Random();
    int index = rand.nextInt(name.length - 1);
    print("newName=${name.substring(index, index + 1)}");

    return name.substring(index, index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/chihiro016.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Wrap(children: [
            Container(
                margin: EdgeInsets.all(30),
                padding:
                    EdgeInsets.all(30),
                decoration: new BoxDecoration(
                  color: Colors.white.withAlpha(200),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black.withAlpha(200), width: 5),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    _yubabaText,
                    style: TextStyle(fontSize: 30),
                  ),
                ])),
          ]),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 500,
              height: 400,
              margin: EdgeInsets.all(20),
              color: Color(0xffe3ab7a),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(50),
                        child: Text(
                          '契約書',
                          style: TextStyle(fontSize: 50),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 50,
                            child: Text(
                              '甲',
                              style: TextStyle(fontSize: 30),
                            )),
                        SizedBox(
                          width: 300,
                          child: Text(
                            '油屋当主 湯婆婆',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            '乙',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                            width: 300,
                            child: TextField(
                              controller: _nameController,
                              cursorColor: Colors.brown,
                              style: TextStyle(fontSize: 30),
                              maxLength: 30,
                              decoration: InputDecoration(
                                hintText: '名前を入力',
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '契約',
                            style: TextStyle(fontSize: 30, color: Colors.red),
                          ),
                        ),
                        color: Color(0xffe3ab7a),
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          var name = _nameController.text;
                          if (name == null || name.isEmpty) {
                            return;
                          }
                          var newName = _zeitaku(name);

                          setState(
                            () {
                              _yubabaText =
                                  'フン。\n$nameというのかい。\n贅沢な名だねぇ。\n\今からお前の名前は$newNameだ。\nいいかい、$newNameだよ。\n分かったら返事をするんだ、$newName!!\n';
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
