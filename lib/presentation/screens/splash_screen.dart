// Splash Screen with Animation
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/splash_screen_controller.dart';
class SplashScreen extends StatelessWidget {
    SplashScreen({super.key});

final splashController = Get.put(SplashScreenController());
 

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx( () =>AnimatedPositioned(
              duration: Duration(milliseconds: 1600),
              left: splashController.animate.value ? 100: -130,
              top:  splashController.animate.value ? 200: -250,
              
              child: Image.asset('assets/cloud.png',height: 150, width: 150,),
              ),
          ),
            Obx( ()=> AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
              left: splashController.animate.value ? 105: -135,
              top: splashController.animate.value ? 200: -250,
              child: Image.asset('assets/sun.png',height: 150, width: 150,),
              ),
            ),
            Obx(() => AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
              left: splashController.animate.value ? 60 :-90,
              bottom: 350,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1:0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Weatherify",style: TextStyle(color: AppTheme.sunnyColor,fontSize: 70,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              ),
            ),
        ],
      ),
    );
  }

}
