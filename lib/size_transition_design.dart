import 'package:flutter/material.dart';

class SizeTransitionDesign extends StatefulWidget {
  const SizeTransitionDesign({super.key});

  @override
  State<SizeTransitionDesign> createState() => _SizeTransitionDesignState();
}

class _SizeTransitionDesignState extends State<SizeTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Tween<double> tween = Tween<double>(begin: 1, end: 0);

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

  void startAnimation() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizeTransition(
                sizeFactor: _animation,
                child: Icon(
                  Icons.favorite,
                  size: 500,
                  color: Colors.red,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: startAnimation),
    );
  }
}
