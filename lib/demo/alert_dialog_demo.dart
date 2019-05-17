import 'package:flutter/material.dart';

enum Action { OK, Cancel }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choose = 'Nothing';

  _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      // 点击周围不消失
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context, Action.Cancel),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context, Action.OK),
            ),
          ],
        );
      },
    );

    setState(() {
      switch (action) {
        case Action.Cancel:
          _choose = 'Cancel';
          break;
        case Action.OK:
          _choose = 'OK';
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
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You choose is $_choose'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('open a alert dialog'),
                  onPressed: _openAlertDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
