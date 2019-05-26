import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationSize;
  Animation _animationColor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        // // 初始值
        // value: 32.0,
        // // 最小值
        // lowerBound: 32.0,
        // // 最大值
        // upperBound: 100.0,
        vsync: this,
        duration: Duration(milliseconds: 3000));
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      print(status);
    });

    // 与直接设置lowerBound和upperBound相比更为灵活
    _animationSize = Tween(begin: 32.0, end: 100.0).animate(_animationController);
    _animationColor = ColorTween(begin: Colors.red[900], end: Colors.red).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: _animationSize.value,
        color: _animationColor.value,
        onPressed: () {
          switch (_animationController.status) {
            case AnimationStatus.forward:
              _animationController.reverse();
              break;
            case AnimationStatus.completed:
              _animationController.reverse();
              break;
            case AnimationStatus.reverse:
              _animationController.forward();
              break;
            case AnimationStatus.dismissed:
              _animationController.forward();
              break;
            default:
          }
        },
      ),
    );
  }
}
