// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int people) {
    setState(() {
      _people += people;

      if (_people < 0) {
        _infoText = "Mundo invertido!";
      } else if (_people>0 && _people < 10 ) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Cheio!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/win11.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text("-1",
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text("+1",
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ))
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        ),
      ],
    );
  }
}
