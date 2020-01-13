import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget{
  TimerPage({Key key}) : super(key: key);
  static String tag = 'timer-page';

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  Widget build(BuildContext context) {

  final navBar = new ButtonBar(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      new RawMaterialButton(
        onPressed: () {},
        child: new Icon(
        Icons.access_time,
        color: Colors.blueGrey,
        size: 35.0,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(15.0),
      ),
      new RawMaterialButton(
        onPressed: () {},
        child: new Icon(
        Icons.calendar_today,
        color: Colors.blueGrey,
        size: 35.0,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(15.0),
      ),
      new RawMaterialButton(
        onPressed: () {},
        child: new Icon(
        Icons.library_books,
        color: Colors.blueGrey,
        size: 35.0,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(15.0),
      ),
      new RawMaterialButton(
        onPressed: () {},
        child: new Icon(
        Icons.insert_chart,
        color: Colors.blueGrey,
        size: 35.0,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(15.0),
      ),
    ],
  );

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            navBar,
          ],
        ),
      ),
    );
  }
}
