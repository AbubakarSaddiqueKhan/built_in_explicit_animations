import 'package:flutter/material.dart';

class RelativePositionedTransitionedDesign extends StatefulWidget {
  const RelativePositionedTransitionedDesign({super.key});

  @override
  State<RelativePositionedTransitionedDesign> createState() =>
      _RelativePositionedTransitionedDesignState();
}

class _RelativePositionedTransitionedDesignState
    extends State<RelativePositionedTransitionedDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Rect?> _animation;
  RectTween relativeRectTween = RectTween(
      begin: Rect.fromLTWH(0, 0, 200, 200),
      end: Rect.fromLTWH(1500, 900, 200, 200));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = relativeRectTween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void changeContainerPosition() async {
    await _animationController.forward();
    _animationController.reverse();

    // _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Relative Positioned Transition Design"),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: clientHeight,
        color: Colors.white,
        child: Stack(
          children: [
            RelativePositionedTransition(
              rect: _animation,
              child: Text("Abubakar",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.purple,
                      fontStyle: FontStyle.italic)),
              size: Size(200, 200),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: changeContainerPosition),
    );
  }
}
