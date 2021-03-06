import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math' as math;
import 'agenda.dart';
import 'howto.dart';
import 'stats.dart';

class TimerPage extends StatefulWidget{
  TimerPage({Key key}) : super(key: key);
  static String tag = 'timer-page';

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {

  int _selectedIndex = 0;
  AnimationController controller;

  List<String> _duree = ['5 minutes', '10 minutes', '15 minutes', '20 minutes', '25 minutes', '30 minutes', '35 minutes', '40 minutes'];
  String _dureeSelected;
  int _timerSelected = 0;

  //Gestion du son (notification de fin de timer)
  static AudioCache player = new AudioCache();
  static const alarmAudioPath = "sounds/end_sound.mp3";

  bool playing = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _timerSelected),
    );
  }

  void majTimer(){
    controller.duration = Duration(seconds: _timerSelected);
    controller.value = 1;
  }

  //navigation entre les pages
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
    ThemeData themeData = Theme.of(context);

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
        AnimatedBuilder(
          animation: controller
            ..addStatusListener((status) {
              //on checke si le timer est terminé grâce à son animation
            if (status == AnimationStatus.dismissed) {
              player.play(alarmAudioPath);
            }
          }),
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.fromLTRB(45, 90, 45, 40),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin : EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      ),
                    ),
                    child:
                    DropdownButtonHideUnderline(
                      child:
                      DropdownButton<String>(
                          hint:
                          Container(
                            margin : EdgeInsets.all(15),
                            child:
                            Text('Sélectionnez une durée',
                              //style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          items: _duree.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child:
                              Container(
                                margin : EdgeInsets.all(15),
                                child:
                                new Text(value),
                              ),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _dureeSelected = value;
                              switch(value){
                                case '5 minutes' : {
                                  _timerSelected = 5*1; //TODO change the value to 60 after tests
                                }
                                break;
                                case '10 minutes' : {
                                  _timerSelected = 10*60;
                                }
                                break;
                                case '15 minutes' : {
                                  _timerSelected = 15*60;
                                }
                                break;
                                case '20 minutes' : {
                                  _timerSelected = 20*60;
                                }
                                break;
                                case '25 minutes' : {
                                  _timerSelected = 25*60;
                                }
                                break;
                                case '30 minutes' : {
                                  _timerSelected = 30*60;
                                }
                                break;
                                case '35 minutes' : {
                                  _timerSelected = 35*60;
                                }
                                break;
                                case '40 minutes' : {
                                  _timerSelected = 40*60;
                                }
                                break;
                              }
                              majTimer();
                            });
                          },
                          value: _dureeSelected
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child:
                              AnimatedBuilder(
                                animation: controller,
                                builder:
                                    (BuildContext context, Widget child) {
                                  return CustomPaint(
                                      painter: CustomTimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.white,
                                        color: themeData.indicatorColor,
                                      )
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.center,
                              //timer affiché
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  AnimatedBuilder(
                                    animation: controller,
                                    builder: (BuildContext context,
                                        Widget child) {
                                      return Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return FloatingActionButton.extended(
                          onPressed: () {
                            if (controller.isAnimating){
                              controller.stop();
                              setState(() {
                                playing = false;
                              });
                            }
                            else {
                              controller.reverse(
                                  from: controller.value == 0.0
                                  ? 1.0
                                  : controller.value);
                              setState(() {
                                playing = true;
                              });
                            }
                          },
                          icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                          label: Text(playing ? "Pause" : "Démarrer"),
                      );
                    },
                  ),
                ],
              ),
            );
          },
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

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
