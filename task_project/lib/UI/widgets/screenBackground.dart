import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/screen-back.svg',
          height: screenSize.height,
          width: screenSize.width,
          fit: BoxFit.cover,
        ),
        child
      ],
    );
  }
}
