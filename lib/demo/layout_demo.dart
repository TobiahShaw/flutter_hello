import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconBadget(Icons.pool)
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
