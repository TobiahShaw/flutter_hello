import 'package:flutter/material.dart';

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
