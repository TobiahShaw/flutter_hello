import 'package:flutter/material.dart';

enum Option { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choose = 'Nothing';

  _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('simple dialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('option A'),
                onPressed: () => Navigator.pop(context, Option.A),
              ),
              SimpleDialogOption(
                child: Text('option B'),
                onPressed: () => Navigator.pop(context, Option.B),
              ),
              SimpleDialogOption(
                child: Text('option C'),
                onPressed: () => Navigator.pop(context, Option.C),
              ),
            ],
          );
        });

    setState(() {
      switch (option) {
        case Option.A:
          _choose = 'A';
          break;
        case Option.B:
          _choose = 'B';
          break;
        case Option.C:
          _choose = 'C';
          break;
        default:
          _choose = 'Nothing';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('Your choose is $_choose')],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
