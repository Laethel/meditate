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
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/howtobg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child :
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 64),
            Container(
              width: 150,
              child: Text(
                "How to medidate : ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 32),
            Container(
              //width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 1 - Get comfortable \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              //width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "Sit comfortably. Relax all of your muscles, or at least the ones you can.\n \n"
                    + "Take a few deep, long breaths and make sure you hold each of them for a few seconds. \n \nYou can use the 7-4-7 technique: "
                    + "breathe in for 7 seconds, hold it for 4 seconds, then exhale for 7 second. This helps if you can’t get your mind to shut up. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 2 - Close your eyes \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                    "Do this as the first thing after sitting down. \n \nWhile it is very possible to meditate with eyes open, I don’t suggest it – "
                    + "the imagery will do the opposite of what you’re trying to do – it will create thoughts. You are trying to get rid of any thoughts whatsoever. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 3 - Focus so you can “unfocus” \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "What you’re trying to do in a meditation is to get into a state of pure awareness, consciousness, nothingness, stillness, thoughtless. \n \n"
                    +"In other words – you are trying to throw all the thoughts out of your mind, all the chatter and find out what remains when it’s all gone – "
                    +"that’s the ultimate meaning. \n \nFocus on something simple : \n \n"
                    +"  • Your own breath \n"
                    +"  • The sound of your heartbeat (you can hear it if you focus, in complete silence)\n"
                    +"  • Dropping water (not rain)\n"
                    +"  • The sound of a clock ticking\n"
                    +"  • Physical sensations (simply become aware: I am aware of how it feels to sit on this sofa. I am aware of how the air coming in and out of my nose feels on my skin. "
                    +"I am aware of all the sounds I hear…)\n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 4 - Let it flow \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "The biggest mistake people tend to make is that they try to focus really, really hard in order to get their minds clear of the thought-trains.\n \n"
                    +"Try to direct the thoughts, but don’t try to “overpower” them. If there’s a random thought that pops up, like "
                    +"“I would like a pizza… pizza is good because it has cheese on it..” just acknowledge it, then get back to whatever you were focusing on before – "
                    +"whether it was your breath or heartbeat. \n \nIf you try too hard, you only get anxious. Just let it flow – after all, it doesn’t really matter. "
                    +"As long as you sit still, motionless, you can call it a meditation. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 5 - How long ?\n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "Try the first one without a timer and try to meditate for as long as possible. When you feel you simply can’t take it anymore, open your eyes and check how long it was.\n"
                    +"If it was 8 minutes, your meditation routine should then be 10 minutes per session, until you feel you can comfortably do more. If it was 15 minutes, set 20.\n \n"
                    +"Prolong your meditations regularly – that is, if you practice every day and if you don’t, all of this is probably worthless. As soon as you can meditate for "
                    +"15 minutes without getting any anxiety or stress, increase to 20 and so on. Get better on each try. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 6 - Can I move ?\n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "The point is not to move, but don’t take that too seriously. \n \nIf you are 5 minutes into the meditation and feel really still, time already stopped, but you just got "
                    +"a really serious, huge ITCH and it’s making you literally go crazy, just go and scratch it, or move the almost-dead leg if you need to – similar as in trying to "
                    +"fall asleep, you shouldn’t move but if you have to, go ahead. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 7 - The sound of silence \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "After a few minutes, if you did it right, a very interesting thing happens. First of all, slowly but surely you start losing your consciousness.\n"
                    +"It feels like falling asleep but you’re still perfectly awake and aware. It feels like ceasing to exist. But, there’s another amazing thing : "
                    +"You can hear the silence. You can literally hear the silence, and the longer/deeper you meditate, the louder it becomes. \n \n"
                    +"The outside sounds are more distant by each passing second and you feel overwhelmed in silence – it sounds like being on an airplane, sort of, but everyone "
                    +"describes it differently, so while I may try to communicate the feeling, you probably have to experience it for yourself in order to understand. \n \nOne thing is for "
                    +"sure though: \n \nIt is the most amazing feeling ever. Because you get completely disconnected from reality and all that remains is the state of Samandhi. \n \n"
                    +"Trust me when I say it feels better than any drug you have ever tried or any feeling you have ever felt. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 150,
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Step 8 - Refreshment \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
              child: Text(
                "You will probably feel refreshed after opening your eyes, as if you only woke up from a good, long night sleep.\n \n"
                    +"The biggest positive is that there’s a big chance you will realize something about yourself, your life, your current situation, whatever – "
                    +"and that realization will eventually lead you to take action which you wouldn’t normally take. \n \nThis is how meditation can change lives. \n",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
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
