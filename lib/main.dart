import 'package:flutter/material.dart';
import './Authentication/login.dart';

void main() {
  runApp(Powstik());
}

class Powstik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff16BE48),
        appBarTheme: AppBarTheme(
          color: Color(0xff16BE48),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
