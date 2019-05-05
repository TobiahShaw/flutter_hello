import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Row 部件内部横向排列, Column不间内部纵向排列, 借用了 css 的 flux box 的概念
    return Container(
      child: SizedBoxDemo(),
    );
  }
}

class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // SizedBox 不指定尺寸时，使用包裹内容的尺寸，也可以不设置内容，当作间隔来使用
          SizedBox(
            child: Container(
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 53, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: 200.0,
            height: 300.0,
            child: Container(
              // Alignment 代表子部件的位置，0.0，0.0 代表中间，1.0，0.0代表最右边，以此类推，也可以引用系统提供的一些方式
              alignment: Alignment(1.0, -0.8),
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 53, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          )
        ],
      ),
    );
  }
}

class RowOrColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // 对于 Row 和 Column 主轴是不同的 Row 主轴是横向的, Column 中主轴是纵向的
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // 交叉轴 crossAxis 是和主轴垂直的, 可以用于该方向的对齐方式和拉伸(stretch)
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconBadget(Icons.pool),
        IconBadget(
          Icons.beach_access,
          size: 64.0,
        ),
        IconBadget(Icons.airplanemode_active),
      ],
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
