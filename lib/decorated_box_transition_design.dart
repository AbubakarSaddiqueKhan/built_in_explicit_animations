import 'package:flutter/material.dart';

class DecoratedBoxTransitionDesign extends StatefulWidget {
  const DecoratedBoxTransitionDesign({super.key});

  @override
  State<DecoratedBoxTransitionDesign> createState() =>
      _DecoratedBoxTransitionDesignState();
}

class _DecoratedBoxTransitionDesignState
    extends State<DecoratedBoxTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Decoration> _animation;

  DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          borderRadius: BorderRadius.circular(70), color: Colors.amber),
      end: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.purple));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = decorationTween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void changeContainerDecoration() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decorated Box Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: DecoratedBoxTransition(
            decoration: _animation,
            child: Container(
              width: 800,
              height: 800,
            )),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: changeContainerDecoration),
    );
  }
}
