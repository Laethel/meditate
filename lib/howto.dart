import 'package:flutter/material.dart';
import 'timer.dart';
import 'agenda.dart';
import 'stats.dart';

class HowtoPage extends StatefulWidget{
  HowtoPage({Key key}) : super(key: key);
  static String tag = 'howto-page';

  @override
  _HowtoPageState createState() => _HowtoPageState();
}

class _HowtoPageState extends State<HowtoPage> {

  int _selectedIndex = 2;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AgendaPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => HowtoPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => StatsPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Instructions"),
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child :
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Timer'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Agenda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Instructions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Stats'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
