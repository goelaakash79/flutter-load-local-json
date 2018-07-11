import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      theme: new ThemeData(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
          accentColor: Colors.red),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              // Decode Json
              var mydata = JSON.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                      margin: new EdgeInsets.all(4.0),
                      child: new Container(
                        padding: new EdgeInsets.all(8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Container(
                              padding: new EdgeInsets.all(4.0),
                              child: new Text("Name: " + mydata[index]['name']),
                            ),
                            new Container(
                              padding: new EdgeInsets.all(4.0),
                              child: new Text("Age: " + mydata[index]['age']),
                            ),
                            new Container(
                              padding: new EdgeInsets.all(4.0),
                              child: new Text(
                                  "Mobile: " + mydata[index]['mobile']),
                            ),
                            new Container(
                              padding: new EdgeInsets.all(4.0),
                              child: new Text(
                                  "Address: " + mydata[index]['address']),
                            ),
                          ],
                        ),
                      ));
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }

  JsonCodec buildJson() => JSON;
}
