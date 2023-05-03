import 'package:flutter/material.dart';
import 'dart:math';



class iosguessgame extends StatelessWidget {
  const iosguessgame({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ios-guess-game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'ios-guess-game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String t1='', result=''; int num1=75;
  guess g=guess();
  TextEditingController a =TextEditingController();
  void _incrementCounter() {
    setState(() {
      result=g.seeifguessedright(n1:num1);
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });

  }
  void reset(){
    setState(() {
      g.reset();
      result ='';
      a.text='';
    });


  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( result, style: TextStyle(fontSize: 23), ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: a,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter 1-100 please'
                ),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  t1=text;
                  num1=int.parse(t1);
                },
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 120, height: 60, color: Colors.grey,
                    child: RawMaterialButton(onPressed: reset, child: Text('Reset'),)),
                Container(width: 120, height: 60, color: Colors.green,
                    child: RawMaterialButton(onPressed: _incrementCounter, child: Text('Play Again'),))



              ],
            ),

          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// if user enters more than 75 than it will say too high1
// if user enter less tahn 75 then it will say tooo low
// if user enters 75 then it will say congrats you won
class guess {
  int n1 = 0, secret = Random().nextInt(100),count=0; String output = '';
  guess({this.n1 = 0});
  String seeifguessedright({n1}) {
    print(secret);
    count=count+1;
    if (n1 < secret) output = 'too low';
    else if (n1 > secret) output = 'too high';
    else if (n1 == secret) {
      output = 'great job you got it,took $count times';
      count=0;
      secret=Random().nextInt(100);
    }
    return output;
  }

  void reset(){
    count=0;
    secret=Random().nextInt(100);
  }
}