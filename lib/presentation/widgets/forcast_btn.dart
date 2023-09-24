import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';

Widget forcastButton() {
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_up))
      ],
    ),
  );
}
