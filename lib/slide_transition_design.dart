import 'package:flutter/material.dart';

class SlideTransitionDesign extends StatefulWidget {
  const SlideTransitionDesign({super.key});

  @override
  State<SlideTransitionDesign> createState() => _SlideTransitionDesignState();
}

class _SlideTransitionDesignState extends State<SlideTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  // According to the official documentation
  //  For example, an Offset with a dx of 0.25 will result in a horizontal translation of one quarter the width of the child.
  Tween<Offset> tween = Tween<Offset>(begin: Offset(-1, -1), end: Offset(1, 1));

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

  void slideContainer() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slide Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: slideContainer),
    );
  }
}
