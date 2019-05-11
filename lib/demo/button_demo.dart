import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('FlatButton'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        SizedBox(
          width: 16.0,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButton.icon'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final _raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.accent, shape: StadiumBorder())),
          child: RaisedButton(
            child: Text('RaisedButton'),
            onPressed: () {},
            splashColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
            elevation: 0.0,
            // color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('RaisedButton.icon'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final _outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.accent, shape: StadiumBorder())),
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
            // color: Theme.of(context).accentColor,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            highlightedBorderColor: Colors.grey,
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('OutlineButton.icon'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    final _fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          child: OutlineButton(
            child: Text('FixedWidthButton'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );

    final _expendedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 只有一个的情况下占满全部空间
        Expanded(
          child: OutlineButton(
            child: Text('ExpendedButton'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        // 两个的情况下分享剩余空间
        Expanded(
          // 调整权重
          flex: 2,
          child: OutlineButton(
            child: Text('ExpendedButton'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );

    final _buttonBar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 会有个边距，受到主题影响
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 16.0)
            )
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('ButtonBar'),
                onPressed: () {},
                splashColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('ButtonBar'),
                onPressed: () {},
                splashColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flatButtonDemo,
            _raisedButtonDemo,
            _outlineButtonDemo,
            _fixedWidthButton,
            _expendedButton,
            _buttonBar,
          ],
        ),
      ),
    );
  }
}