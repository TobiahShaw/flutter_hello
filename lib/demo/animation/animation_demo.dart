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
  CurvedAnimation _curve;

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
    // _animationController.addListener(() {
    //   setState(() {});
    // });

    _animationController.addStatusListener((status) {
      print(status);
    });
    _curve = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    // 与直接设置lowerBound和upperBound相比更为灵活
    _animationSize = Tween(begin: 32.0, end: 100.0).animate(_curve);
    _animationColor =
        ColorTween(begin: Colors.red[900], end: Colors.red).animate(_curve);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [_animationSize, _animationColor],
        controller: _animationController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List<Animation> animations;
  final AnimationController controller;

  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.forward:
            controller.reverse();
            break;
          case AnimationStatus.completed:
            controller.reverse();
            break;
          case AnimationStatus.reverse:
            controller.forward();
            break;
          case AnimationStatus.dismissed:
            controller.forward();
            break;
          default:
        }
      },
    );
  }
}
