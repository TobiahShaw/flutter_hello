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
      body: Counter2(
        count: _count,
        increaseCount: () {
          setState(() {
            _count += 1;
          });
        },
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

// 这种方法是重构 StateManagementDemo 部件
class Counter extends StatelessWidget {
  final int count;

  Counter({this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$count'),
      ),
    );
  }
}

class Counter2 extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter2({this.count, this.increaseCount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}
