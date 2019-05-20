import 'package:flutter/material.dart';

class StateManagementDemo extends StatelessWidget {
  // 会提醒成员必须都是final的，因为被不可变化的注解标记
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(
          label: Text('$_count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // count发生改变而界面并不会发生改变
          _count += 1;
          print(_count);
        },
      ),
    );
  }
}