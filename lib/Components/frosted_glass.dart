import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  const FrostedGlassBox({
    super.key,
    required this.theWidth,
    required this.theHeight,
    required this.mainAxisAlignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25.0,
                sigmaY: 25.0,
              ),
              child: Container(),
            ),
            //gradient effect ==> the second layer of stack
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.white.withOpacity(0.01),
                  ],
                ),
              ),
            ),
            //child ==> the first/top layer of stack
            Column(
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
