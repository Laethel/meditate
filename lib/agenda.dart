import 'dart:core';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'timer.dart';
import 'howto.dart';
import 'stats.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AgendaPage extends StatefulWidget{
  AgendaPage({Key key}) : super(key: key);
  static String tag = 'agenda-page';

  @override
  AgendaPageState createState() => AgendaPageState();
}

class AgendaPageState extends State<AgendaPage> {

  int _selectedIndex = 1;

  bool notifications = false;
  bool meditationDay = false;
  bool everyDay = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  List<String> weekdays = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"];
  List<String> meditationDays = [];

  bool deactivateAllDays = false;

  var time = DateTime.now();
  String _time = "Not set";
  String timeHour = "0";
  String timeMinutes = "0";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState(){
    super.initState();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('peace_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    isTodayMeditationDay();
    if(notifications && meditationDay){
      showNotification();
    }
  }

  bool isTodayMeditationDay(){
    if(meditationDays.contains('${time.weekday}')){
      meditationDay = true;
    }
    return meditationDay;
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  Future showNotification() async {
    DateTime notifTime = DateTime(time.year, time.month, time.day, int.parse(timeHour), int.parse(timeMinutes), time.second, time.millisecond, time.microsecond);
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    //variable
    await flutterLocalNotificationsPlugin.schedule(
        0, 'Reminder', 'It\'s medidation time !', notifTime, platform,
        payload: 'Quentin');
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

    final testNotif = new RawMaterialButton(
      onPressed: showNotification,
      child: new Icon(
        Icons.texture,
        color: Colors.blueGrey,
        size: 20.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Color(0xFFFFFFFF).withOpacity(0.9),
      padding: const EdgeInsets.all(10.0),
    );

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
            testNotif,

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
                      timeHour = '${time.hour}';
                      timeMinutes = '${time.minute}';
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
                List<bool> days = [monday, tuesday, wednesday, thursday, friday, saturday, sunday];
                for(int i = 0; i<days.length; i++){
                  if(days.elementAt(i)){
                    meditationDays.add(weekdays.elementAt(i).toString());
                    print(weekdays.elementAt(i).toString());
                  }
                }
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
