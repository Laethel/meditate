import 'package:flutter/material.dart';
import 'timer.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {

    final buttonTimer = new RawMaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
      },
      child: new Icon(
        Icons.access_time,
        color: Colors.blueGrey,
        size: 70.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Color(0xFFFFFFFF).withOpacity(0.9),
      padding: const EdgeInsets.all(25.0),
    );

    final buttonAgenda = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.calendar_today,
        color: Colors.blueGrey,
        size: 60.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Color(0xFFFFFFFF).withOpacity(0.9),
      padding: const EdgeInsets.all(30.0),
    );

    final buttonHowto = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.library_books,
        color: Colors.blueGrey,
        size: 60.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Color(0xFFFFFFFF).withOpacity(0.9),
      padding: const EdgeInsets.all(30.0),
    );

    final buttonStats = new RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.insert_chart,
        color: Colors.blueGrey,
        size: 60.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Color(0xFFFFFFFF).withOpacity(0.9),
      padding: const EdgeInsets.all(30.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:
        Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[

              SizedBox(height: 64),

              new Container(
                margin: const EdgeInsets.only(left: 24),
                child: new Text('Bienvenue, Quentin',
                  style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 34),
                ),
              ),

              SizedBox(height: 128),

              //ligne des boutons Timer et Agenda
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                    child:
                    buttonTimer
                  ),
                  SizedBox(width: 64),
                  new Flexible(
                    child :
                    buttonAgenda,
                  ),
                ],
              ),

              SizedBox(height: 64),

              //ligne des boutons HowTo et Stats,
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                      child:
                      buttonHowto
                  ),
                  SizedBox(width: 64),
                  new Flexible(
                    child :
                    buttonStats,
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
