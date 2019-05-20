import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  // StatefulWidget 也是被不可变化的注解标记， 我们要单独设置一个状态
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
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
          // count 通过setState进行改变
          setState(() {
            _count += 1;
          });
          print(_count);
        },
      ),
    );
  }
}
