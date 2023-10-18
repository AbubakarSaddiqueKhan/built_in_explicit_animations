import 'package:flutter/material.dart';

class ScaleTransitionDesign extends StatefulWidget {
  const ScaleTransitionDesign({super.key});

  @override
  State<ScaleTransitionDesign> createState() => _ScaleTransitionDesignState();
}

class _ScaleTransitionDesignState extends State<ScaleTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Tween<double> tween = Tween<double>(begin: 1, end: 2);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = tween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void scaleContainer() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 350,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: scaleContainer),
    );
  }
}
