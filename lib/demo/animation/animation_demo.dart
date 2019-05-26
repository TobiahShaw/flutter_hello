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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        // 初始值
        value: 32.0,
        // 最小值
        lowerBound: 0.0,
        // 最大值
        upperBound: 100.0,
        vsync: this,
        duration: Duration(milliseconds: 3000));
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('${_animationController.value}'),
        onPressed: () => _animationController.forward(),
      ),
    );
  }
}
