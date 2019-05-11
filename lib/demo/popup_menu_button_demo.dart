import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _current = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_current),
                PopupMenuButton(
                  onSelected: (value) => {
                    setState(() {
                      _current = value;
                    })
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Home',
                          child: Text('Home'),
                        ),
                        PopupMenuItem(
                          value: 'Discovery',
                          child: Text('Discovery'),
                        ),
                        PopupMenuItem(
                          value: 'Community',
                          child: Text('Community'),
                        )
                      ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
