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
            children: <Widget>[RegistForm()],
          ),
        ),
      ),
    );
  }
}

class RegistForm extends StatefulWidget {
  @override
  _RegistFormState createState() => _RegistFormState();
}

class _RegistFormState extends State<RegistForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void _submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username, password: $password');
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String _validatorUseername(value) {
    if (value.isEmpty) {
      return 'username is required';
    }
    return null;
  }

  String _validatorPassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          // 相当于在 FormField 中加入一个 TextField
          TextFormField(
            decoration: InputDecoration(labelText: 'username', helperText: ''),
            onSaved: (value) => username = value,
            validator: _validatorUseername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            // 输入内容马赛克
            obscureText: true,
            decoration: InputDecoration(labelText: 'password', helperText: ''),
            onSaved: (value) => password = value,
            validator: _validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: _submitRegisterForm,
            ),
          )
        ],
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
