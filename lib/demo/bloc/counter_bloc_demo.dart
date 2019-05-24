import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBolc _bloc = CounterProvide.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _bloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _bloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBolc _bloc = CounterProvide.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _bloc.counter.add(1);
      },
    );
  }
}

class CounterProvide extends InheritedWidget {
  final Widget child;
  final CounterBolc bloc;

  CounterProvide({this.child, this.bloc}) : super(child: child);

  static CounterProvide of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvide);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterBolc {
  int _count = 0;
  final _counterActionController = StreamController<int>();
  final _countController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;
  Stream<int> get count => _countController.stream;
  CounterBolc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count += data;
    _countController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _countController.close();
  }

  void log() {
    print('Bloc');
  }
}
