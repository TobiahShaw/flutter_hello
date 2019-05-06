import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageViewDemo();
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 页面是否自动滚动到下一个，false，可以页面拖动到任意位置，而不是拖到某个位置松手自动渠道下个页面
      pageSnapping: true,
      // 倒置，one任然为第一个，只是滚动方向倒置
      reverse: false,
      // 滚动方向
      scrollDirection: Axis.vertical,
      onPageChanged: (current)=> debugPrint('page: $current'),
      controller: PageController(
        initialPage: 1,
        keepPage: true,
        // 可视范围 1.0 占满
        viewportFraction: 0.85
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
