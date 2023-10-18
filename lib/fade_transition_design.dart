import 'package:flutter/material.dart';

class FadeTransitionDesign extends StatefulWidget {
  const FadeTransitionDesign({super.key});

  @override
  State<FadeTransitionDesign> createState() => _FadeTransitionDesignState();
}

class _FadeTransitionDesignState extends State<FadeTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  Tween<double> tween = Tween<double>(begin: 1, end: 0);

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
        title: Text("Fade Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
            opacity: _animation,
            child: Container(
              width: 800,
              height: 800,
              color: Colors.amber,
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateContainer),
    );
  }
}
