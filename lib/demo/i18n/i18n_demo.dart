import 'package:flutter/material.dart';

class I18NDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18NDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString())
          ],
        ),
      )
    );
  }
}