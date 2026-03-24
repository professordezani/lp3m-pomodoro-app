import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(PomodoroApp());
}

enum Status { shortBreak, workHard }

class PomodoroApp extends StatefulWidget {
  @override
  State<PomodoroApp> createState() => _PomodoroAppState();
}

class _PomodoroAppState extends State<PomodoroApp> {
  // atributos:
  Timer? _timer;
  var backgroundColor = Colors.green[50];
  var borderColor = Colors.green;
  var textColor = Colors.green[900];
  var smallSplashColor = Colors.green[100];
  var bigSplashColor = Colors.green[300];
  var lightColor = Color.fromRGBO(77, 218, 110, 0.15);
  var darkColor = Color.fromRGBO(77, 218, 110, 0.62);
  var title = "Short Break";
  var icon = Icons.coffee_outlined;
  var status = Status.shortBreak;
  var seconds = 15;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  // método:
  void changeStatus() {
    if (status == Status.shortBreak) {
      status = Status.workHard;
      backgroundColor = Colors.red[50];
      borderColor = Colors.red;
      textColor = Colors.red[900];
      smallSplashColor = Colors.red[100];
      bigSplashColor = Colors.red[300];
      lightColor = Color.fromRGBO(255, 76, 76, 0.15);
      darkColor = Color.fromRGBO(255, 76, 76, 0.62);
      title = "Work Hard";
      icon = Icons.work_outline;
      seconds = 45;
    } else {
      status = Status.shortBreak;
      backgroundColor = Colors.green[50];
      borderColor = Colors.green;
      textColor = Colors.green[900];
      smallSplashColor = Colors.green[100];
      bigSplashColor = Colors.green[300];
      lightColor = Color.fromRGBO(77, 218, 110, 0.15);
      darkColor = Color.fromRGBO(77, 218, 110, 0.62);
      title = "Short Break";
      icon = Icons.coffee_outlined;
      seconds = 15;
    }

    setState(() {}); // reexecuta o método build()
  }

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  void stop() {
    _timer?.cancel();
    setState(() {});
  }

  void onTick(Timer _) {
    if (seconds > 0) {
      seconds = seconds - 1;
      setState(() {});
    } else {
      changeStatus();
    }
  }

  void increment10Seconds() {
    setState(() => seconds += 10);
  }

  @override
  Widget build(BuildContext context) {
    var txtMinutes = (seconds ~/ 60).toString().padLeft(2, "0");
    var txtSeconds = (seconds % 60).toString().padLeft(2, "0");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        color: backgroundColor,
        child: Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 125,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: lightColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(icon, size: 18), Text(title)],
              ),
            ),
            Text(
              "$txtMinutes\n$txtSeconds",
              style: TextStyle(
                color: textColor,
                fontSize: 256,
                fontWeight: FontWeight.w200,
                height: 0.85,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                InkWell(
                  onTap: increment10Seconds,
                  borderRadius: BorderRadius.circular(32),
                  splashColor: smallSplashColor,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: .circular(32),
                    ),
                    child: Icon(Icons.forward_10_outlined, size: 32),
                  ),
                ),
                InkWell(
                  onTap: !_timer!.isActive ? start : stop,
                  borderRadius: BorderRadius.circular(32),
                  splashColor: bigSplashColor,
                  child: Container(
                    width: 102,
                    height: 96,
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: .circular(32),
                    ),
                    child: Icon(
                      !_timer!.isActive ? Icons.play_arrow : Icons.pause,
                      size: 32,
                    ),
                  ),
                ),
                InkWell(
                  onTap: changeStatus,
                  borderRadius: BorderRadius.circular(32),
                  splashColor: smallSplashColor,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: .circular(32),
                    ),
                    child: Icon(Icons.fast_forward, size: 32),
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
