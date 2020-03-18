import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'timer.dart';
import 'howto.dart';
import 'stats.dart';

class AgendaPage extends StatefulWidget{
  AgendaPage({Key key}) : super(key: key);
  static String tag = 'agenda-page';

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  int _selectedIndex = 1;

  bool notifications = false;
  bool everyDay = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  bool deactivateAllDays = false;

  String _time = "Not set";

  //TODO notification implementation
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    //recupérer les autorisations de notifs pour IOS
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );

  }

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
            SizedBox(height: 64),

              CheckboxListTile(
                title: const Text("Activate notifications",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                ),
                value: notifications,
                onChanged: (bool value){
                  setState(() {
                    notifications = value;
                  });
                },
              ),

            SizedBox(height: 32),

            Text("Medidation days : ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24,),
            ),

            SizedBox(height: 16),

            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Every day",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  value: everyDay,
                  onChanged: (bool value){
                    setState(() {
                      deactivateAllDays = !deactivateAllDays;
                      everyDay = value;
                      if(value == true){
                        monday = true;
                        tuesday = true;
                        wednesday = true;
                        thursday = true;
                        friday = true;
                        saturday = true;
                        sunday = true;
                      }
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Monday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: monday,
                  onChanged: deactivateAllDays ? null
                  : (bool value){
                    setState(() {
                      monday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Tuesday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: tuesday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      tuesday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Wednesday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: wednesday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      wednesday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Thursday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: thursday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      thursday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Friday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: friday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      friday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Saturday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: saturday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      saturday = value;
                    });
                  },
                ),
            ),
            SizedBox(
              height: 40,
              child:
                CheckboxListTile(
                  title: const Text("Sunday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  value: sunday,
                  onChanged: deactivateAllDays ? null
                      : (bool value){
                    setState(() {
                      sunday = value;
                    });
                  },
                ),
            ),

            SizedBox(height: 32),

            Text("Medidation time : ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            ),

            SizedBox(height: 32),

            //Time picker
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 4.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                      print('confirm $time');
                      _time = '${time.hour} : ${time.minute}';
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: Colors.black,
                              ),
                              Text(
                                " $_time",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text("Change",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            FloatingActionButton.extended(
              onPressed: () {
                // sauvegarder les données
              },
              label: Text('Save'),
              backgroundColor: Colors.white,
            ),

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
