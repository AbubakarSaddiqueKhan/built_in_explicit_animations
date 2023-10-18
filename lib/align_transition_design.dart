import 'package:flutter/material.dart';

class AlignTransitionDesign extends StatefulWidget {
  const AlignTransitionDesign({super.key});

  @override
  State<AlignTransitionDesign> createState() => _AlignTransitionDesignState();
}

class _AlignTransitionDesignState extends State<AlignTransitionDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _animation;
  Tween<Alignment> tween =
      Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomRight);

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

  void changeContainerAlignment() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align Transition Design"),
        centerTitle: true,
      ),
      body: Center(
        child: AlignTransition(
            alignment: _animation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.purple,
            )),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: changeContainerAlignment),
    );
  }
}
