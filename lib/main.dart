import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//stful is short-key for statefull widget.

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeLeftDiceNumber(){
    setState(() {
      leftDiceNumber= Random().nextInt(6)+1;
      print('Left button get pressed.Number = $leftDiceNumber');
    });
  }

  //When ever press the hotreload this method rerun again. So if you want to incled the changes about your variable
  //you have to put the varaible in the this method.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  //flex: 2,
                  child: FlatButton(
                    child: Image.asset(
                        'images/dice$leftDiceNumber.png'), //this dolar thing provides 'String Interpolation'
                    onPressed: () {
                      changeLeftDiceNumber();
                    },
                  ),
                ),
                Expanded(
                  //flex: 1,
                  child: FlatButton(
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        rightDiceNumber= Random().nextInt(6)+1;
                        print('Right button get pressed.Number = $rightDiceNumber');
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}