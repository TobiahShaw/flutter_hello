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
  @override
  void initState() {
    super.initState();

    print('create a stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('listen a stream');
    _streamDemo.listen(onData, onError: onError, onDone: onDone);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 'something wrong';
    return 'hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
}
