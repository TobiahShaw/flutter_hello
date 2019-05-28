import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
        elevation: 0.0,
      ),
    );
  }
}

class TobiahTestDemo {
  static greet(String name) {
    return 'hello, $name';
  }
}