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
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    super.dispose();

    _streamDemo.close();
  }

  @override
  void initState() {
    super.initState();

    print('create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    // 可多次订阅的broadcast
    _streamDemo = StreamController.broadcast();
    // 初始化sink
    _sinkDemo = _streamDemo.sink;
    print('listen a stream');
    _subscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'something wrong';
    return 'hello ~';
  }

  void onData(String data) {
    print(data);
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String data) {
    print('onDataTwo,$data');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_data'),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) => Text('${snapshot.data}'),
            ),
            Row(
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
                FlatButton(
                  child: Text('add'),
                  onPressed: _addDataToStream,
                ),
              ],
            )
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

  void _addDataToStream() async {
    print('addDataToStream');
    String data = await fetchData();
    // 使用controller添加数据
    // _streamDemo.add(data);
    // 使用sink添加数据
    _sinkDemo.add(data);
  }
}
