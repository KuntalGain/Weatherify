import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppTheme.sunnyColor,
        body: Center(
          child: Text(
            'Hello World',
            style: AppTheme.condition,
          ),
        ),
      ),
    );
  }
}
