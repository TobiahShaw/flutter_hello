import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Row 部件内部横向排列, Column不间内部纵向排列, 借用了 css 的 flux box 的概念
    return Container(
      child: Row(
        // 对于 Row 和 Column 主轴是不同的 Row 主轴是横向的, Column 中主轴是纵向的
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // 交叉轴 crossAxis 是和主轴垂直的, 可以用于该方向的对齐方式和拉伸(stretch)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconBadget(Icons.pool),
          IconBadget(Icons.beach_access, size: 64.0,),
          IconBadget(Icons.airplanemode_active),
        ],
      ),
    );
  }
}

class IconBadget extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadget(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      color: Color.fromRGBO(3, 25, 255, 1.0),
      width: size + 60,
      height: size + 60,
    );
  }
}
