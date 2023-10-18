import 'package:flutter/material.dart';

class RotationTransitionDesign extends StatefulWidget {
  const RotationTransitionDesign({super.key});

  @override
  State<RotationTransitionDesign> createState() =>
      _RotationTransitionDesignState();
}

class _RotationTransitionDesignState extends State<RotationTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Tween<double> tween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = tween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void rotateContainer() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotated Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateContainer),
    );
  }
}
