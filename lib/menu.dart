import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: Menu(title: 'Meditate - Menu principal'),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {

    final buttonTimer = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.access_time,
        color: Colors.blueGrey,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    );

    final buttonAgenda = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.calendar_today,
        color: Colors.blueGrey,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    );

    final buttonHowto = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.library_books,
        color: Colors.blueGrey,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    );

    final buttonStats = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.insert_chart,
        color: Colors.blueGrey,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 32),
            new Container(
              margin: const EdgeInsets.only(left: 24),
              child: new Text('Bienvenue, Quentin',
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            buttonTimer,
            buttonAgenda,
            buttonHowto,
            buttonStats,
          ],
        ),
      ),
    );
  }
}
