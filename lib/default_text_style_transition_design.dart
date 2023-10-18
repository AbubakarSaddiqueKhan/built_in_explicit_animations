import 'package:flutter/material.dart';

class DefaultTextStyleTransitionDesign extends StatefulWidget {
  const DefaultTextStyleTransitionDesign({super.key});

  @override
  State<DefaultTextStyleTransitionDesign> createState() =>
      _DefaultTextStyleTransitionDesignState();
}

class _DefaultTextStyleTransitionDesignState
    extends State<DefaultTextStyleTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<TextStyle> _animation;
  TextStyleTween tween = TextStyleTween(
      begin: TextStyle(
          color: Colors.pink,
          fontStyle: FontStyle.italic,
          fontSize: 50,
          fontWeight: FontWeight.normal),
      end: TextStyle(
          color: Colors.purple,
          fontSize: 100,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold));

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
        title: Text("Default Text Style Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: DefaultTextStyleTransition(
            style: _animation, child: Text("Hi Abubakar")),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateContainer),
    );
  }
}
