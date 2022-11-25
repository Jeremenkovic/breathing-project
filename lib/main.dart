
import 'package:breathing/breather.dart';
import 'package:flutter/material.dart';
import 'countdown_timer.dart';
import 'custom_timer_painer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 205, 129, 255),
        ),
        accentColor: Colors.white,
      ),
      home:CountDownTimer(),
    );
  }
}



