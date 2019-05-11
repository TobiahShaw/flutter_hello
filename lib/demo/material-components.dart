import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'FloatActionButton', page: FloatActionButtonDemo()),
        ],
      ),
    );
  }
}

class FloatActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FloatingActionButton _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );

    FloatingActionButton _floatingActionButtonExtend =
        FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      // 叠加到底部工具栏
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        // 加上缺口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => page)),
    );
  }
}
