import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用 Theme 部件来覆盖部分主题设置
      body: Theme(
        // 将其他主题设置 copy 过来
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[TextFieldDemo()],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 初始值
    textEditingController.text = 'hello';
    textEditingController
        .addListener(() => debugPrint('input:${textEditingController.text}'));
  }

  @override
  void dispose() {
    super.dispose();
    // 用完销毁
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Tittle',
          hintText: 'enter the title of the post.',
          // 边框设置
          // border: InputBorder.none,
          // border: OutlineInputBorder(),
          // 是否填充背景
          filled: true,
          // 背景色
          fillColor: Colors.grey[200]),
      // onChanged: (value) => debugPrint('input:$value'),
      controller: textEditingController,
      onSubmitted: (value) => debugPrint('submit:$value'),
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
