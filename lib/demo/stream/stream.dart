import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    print('create a stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('listen a stream');
    _subscription =
        _streamDemo.listen(onData, onError: onError, onDone: onDone);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'something wrong';
    return 'hello ~';
  }

  void onData(String data) {
    print(data);
  }

  void onError(error) {
    print(error);
  }

  void onDone() {
    print('done');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('pause'),
              onPressed: _pauseStream,
            ),
            FlatButton(
              child: Text('resume'),
              onPressed: _resumeStream,
            ),
            FlatButton(
              child: Text('cancel'),
              onPressed: _cancelStream,
            ),
          ],
        ),
      ),
    );
  }

  void _pauseStream() {
    print('pause sub');
    _subscription.pause();
  }

  void _resumeStream() {
    print('resume sub');
    _subscription.resume();
  }

  void _cancelStream() {
    print('cancel sub');
    _subscription.cancel();
  }
}
