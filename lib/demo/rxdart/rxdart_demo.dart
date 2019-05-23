import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();

    Observable<String> _observable =
        // Observable(Stream.fromIterable(['hello', 'Tobiah']));
        // Observable.fromFuture(Future.value('hello ~'));
        // Observable.fromIterable(['hello', 'Tobiah']);
        // Observable.just('hello, world');
        Observable.periodic(new Duration(seconds: 1), (i) => 'hello, $i').take(5);
    _observable.listen(print);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
