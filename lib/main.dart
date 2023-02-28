import 'package:flutter/material.dart';
import './Authentication/login.dart';

void main() {
  runApp(Powstik());
}

class Powstik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
