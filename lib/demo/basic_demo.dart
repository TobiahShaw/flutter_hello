import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);

  final String _author = "李白";
  final String _title = "将进酒";
  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》 —— $_author。 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪！人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马、千金裘，呼儿将出换美酒，与尔同销万古愁！',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'https://github.com/',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 22.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
          ),
          children: [
            // 同一个控件，添加不同样式的文字，使用TextSpan的children，其children也是TextSpan，默认样式和其父一致
            TextSpan(text: 'TobiahShaw/'),
            TextSpan(
                text: 'flutter_hello',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal)),
          ]),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // container 占据尽可能多的的空间，所以整个都变色了
    return Container(
      // color: Colors.grey,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
          alignment: Alignment.bottomCenter,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.indigoAccent[400].withOpacity(0.5), BlendMode.hardLight)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                // 不能和外面的color属性共用
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.indigoAccent,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                // BoxShape.circle 不可和 borderRadius 一起使用
                // borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  // 可多个叠加
                  BoxShadow(
                      offset: Offset(0.0, 16.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 25.0,
                      spreadRadius: -9.0),
                  BoxShadow(
                      offset: Offset(16.0, 0.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 25.0,
                      spreadRadius: -9.0),
                ],
                // BoxShape.circle 不可和 borderRadius 一起使用
                shape: BoxShape.circle,
                // 渐变效果
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          )
        ],
      ),
    );
  }
}
