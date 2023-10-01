
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherify/constants/theme.dart';


class RainAnimation extends StatefulWidget {
  const RainAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RainAnimationState createState() => _RainAnimationState();
}

class _RainAnimationState extends State<RainAnimation>
    with TickerProviderStateMixin {
  late AnimationController _cloudController;
  late AnimationController _rainController;
  late AnimationController _sunController;
  late AnimationController _textController;

  @override
  void initState() {
    super.initState();

    _cloudController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _rainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _sunController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _startAnimation();
  }

  void _startAnimation() async {
    await _cloudController.forward();
    await Future.delayed(const Duration(milliseconds:500 ));
    await _rainController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    await _sunController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    await _textController.forward();
    Get.toNamed('/home');
  }

  @override
  void dispose() {
    _cloudController.dispose();
    _rainController.dispose();
    _sunController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _cloudController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, -50 * (1 - _cloudController.value)),
                  child: Image.asset(
                    'assets/cloud.png',
                    width: 250,
                    height: 200,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _rainController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, 100 * _rainController.value),
                  child: Image.asset(
                    'assets/raindrop.png',
                    width: 100,
                    height: 100,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _sunController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(200 * (1 - _sunController.value), -60),
                  child: Image.asset(
                    'assets/sun.png',
                    width: 120,
                    height: 120,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end, 
                children:[Opacity(
                  opacity: _textController.value,
                  child: const Align(
            alignment: Alignment.bottomCenter,
                  child: Padding(
                         padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
                    child: Text(
                      "Weatherify",
                      style: TextStyle( color: AppTheme.sunnyColor,fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),),),],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
