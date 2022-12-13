import 'package:flutter/material.dart';
import 'package:flutter_dev/daejeon/weather/loading_screen.dart';



class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}