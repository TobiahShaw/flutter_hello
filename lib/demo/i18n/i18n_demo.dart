import 'package:flutter/material.dart';
// import 'package:hello_world/demo/i18n/localizations_demo.dart';
import 'package:hello_world/demo/i18n/intl_localizations_demo.dart';

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
              Text(locale.toString()),
              Text(
                TobiahDemoLocalizations.of(context).title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                TobiahDemoLocalizations.of(context).greet('Tobiah'),
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ));
  }
}
