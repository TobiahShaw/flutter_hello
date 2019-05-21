import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  // StatefulWidget 也是被不可变化的注解标记， 我们要单独设置一个状态
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper2(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: increaseCount,
        ),
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

// 传递回调来管理
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

// 多级传递, 问题在于中间层级的小部件不需要这些值，依然会通过他们传递
class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  CounterWrapper({this.count, this.increaseCount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter3(
        count: count,
        increaseCount: increaseCount,
      ),
    );
  }
}

class Counter3 extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter3({this.count, this.increaseCount});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// inherit widget 多级传递, 其下的小部件都可以直接获取需要的值
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterWrapper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter4(),
    );
  }
}

class Counter4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}
