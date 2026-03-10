import 'package:flutter/material.dart';

void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.green[50],
        child: Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 125,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(77, 218, 110, 0.15),
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.coffee_outlined, size: 18),
                  Text("Short Break")
                ],
              ),
            ),
            Text("05\n00", style: TextStyle(
              color: Colors.green[900],
              fontSize: 256,
              fontWeight: FontWeight.w200,
              height: 0.85
            )),
          ]
        ),
      ),
    );
  }
}
