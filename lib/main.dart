import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.white38,
          )
        ),
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Dice App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int diceNum1 = 1;
  int diceNum2 = 1;
  final player = AudioCache();

  void update(){
    setState(() {
      diceNum1 = Random().nextInt(6)+1;
      diceNum2 = Random().nextInt(6)+1;
      player.play('diceRoll.mp3');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title,
        style: TextStyle(
          fontFamily: 'Lobster',
        ),),
      ),
      body:
          SizedBox(
            width: double.infinity,
            height: double.infinity,
      child:

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/greenBg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                      Image(
                        image: AssetImage("assets/dice_$diceNum1.png"),
                        height: 150,
                        width: 150,
                      ),
                      Image(
                    image: AssetImage("assets/dice_$diceNum2.png"),
                    height: 150,
                    width: 150,
                  )
                ],
              ),

              ElevatedButton(onPressed:() => update(), child:
              Text("Roll Dice",
              style: TextStyle(
                fontFamily: 'Lobster',
              ),),
              )
            ],
          )
      ),
          ),
    );
  }
}
