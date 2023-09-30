import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/screens/information_screen.dart';

Widget forcastButton(String query) {
  return Container(
    width: 220,
    height: 64,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade300.withOpacity(0.4)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Forcast Report',
          style: AppTheme.buttonText,
        ),
        IconButton(
            onPressed: () {
              Get.to(InformationScreen(
                cityname: query,
              ));
            },
            icon: const Icon(Icons.keyboard_arrow_up))
      ],
    ),
  );
}
