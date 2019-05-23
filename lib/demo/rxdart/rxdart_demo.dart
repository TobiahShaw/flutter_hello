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
  PublishSubject<String> _textFildSubject;
  @override
  void initState() {
    super.initState();

    _textFildSubject = PublishSubject<String>();
    _textFildSubject.listen(print);

    // Observable<String> _observable =
    //     // Observable(Stream.fromIterable(['hello', 'Tobiah']));
    //     // Observable.fromFuture(Future.value('hello ~'));
    //     // Observable.fromIterable(['hello', 'Tobiah']);
    //     // Observable.just('hello, world');
    //     Observable.periodic(new Duration(seconds: 1), (i) => 'hello, $i').take(5);
    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // 特殊的subject 会把最后一次数据发射出去
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // 发送最后maxSize的事件给所有的监听器，无视监听时间
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1 : $data'));
    // // PublishSubject时listen2收不到消息
    // _subject.add('hello');
    // _subject.listen((data) => print('listen 2 : ${data.toUpperCase()}'));
    // _subject.add('hola');

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFildSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
        onChanged: (value) => _textFildSubject.add('input : $value'),
        onSubmitted: (value) => _textFildSubject.add('commit : $value'),
      ),
    );
  }
}
