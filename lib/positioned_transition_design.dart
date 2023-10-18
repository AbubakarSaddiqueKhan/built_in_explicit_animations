import 'package:flutter/material.dart';

class PositionedTransitionedDesign extends StatefulWidget {
  const PositionedTransitionedDesign({super.key});

  @override
  State<PositionedTransitionedDesign> createState() =>
      _PositionedTransitionedDesignState();
}

class _PositionedTransitionedDesignState
    extends State<PositionedTransitionedDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _animation;
  RelativeRectTween relativeRectTween = RelativeRectTween(
      begin: RelativeRect.fromSize(Rect.fromLTWH(0, 0, 200, 200), Size(10, 10)),
      end: RelativeRect.fromSize(
          Rect.fromLTWH(1500, 900, 200, 200), Size(20, 20)));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = relativeRectTween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void rotateContainer() async {
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
        title: Text("Positioned Transition Design"),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: clientHeight,
        color: Colors.white,
        child: Stack(
          children: [
            PositionedTransition(
                rect: _animation,
                child: Text(
                  "Abubakar",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateContainer),
    );
  }
}
