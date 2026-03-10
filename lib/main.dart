import 'package:flutter/material.dart';

void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(32),
                splashColor: Colors.green[100],
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(77, 218, 110, 0.15),
                    borderRadius: .circular(32),
                  ),
                  child: Icon(Icons.forward_10_outlined, size: 32)
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(32),
                splashColor: Colors.green[300],
                child: Container(
                  width: 102,
                  height: 96,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(77, 218, 110, 0.62),
                    borderRadius: .circular(32),
                  ),
                  child: Icon(Icons.play_arrow, size: 32)
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(32),
                splashColor: Colors.green[100],
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(77, 218, 110, 0.15),
                    borderRadius: .circular(32),
                  ),
                  child: Icon(Icons.fast_forward, size: 32)
                ),
              ),
            ],
           ), 
          ]
        ),
      ),
    );
  }
}
