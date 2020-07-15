import 'package:car_shoping/src/components/liquid_pages.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
      pages: liquidPages,
      fullTransitionValue: 300,
      enableLoop: true,
      enableSlideIcon: true,
      positionSlideIcon: 0.8,
      waveType: WaveType.liquidReveal,
      onPageChangeCallback: (page) => pageChangeCallback(page),
      currentUpdateTypeCallback: (updateType) => updateTypeCallback(updateType),
    ));
  }

  pageChangeCallback(int page) {
    print(page);
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}
