import 'package:flutter/material.dart';
import 'agenda.dart';
import 'howto.dart';
import 'stats.dart';

class TimerPage extends StatefulWidget{
  TimerPage({Key key}) : super(key: key);
  static String tag = 'timer-page';

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  int _selectedIndex = 0;


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
        title: Text("Timer"),
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
