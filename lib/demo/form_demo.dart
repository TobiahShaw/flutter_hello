import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用 Theme 部件来覆盖部分主题设置
      body: Theme(
        // 将其他主题设置 copy 过来
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: ThemeDemo(),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}