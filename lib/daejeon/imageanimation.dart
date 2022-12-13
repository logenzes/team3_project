import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var _size = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
        actions: <Widget> [
          IconButton(
            onPressed: () {
              print("image test");
            },
            icon: Image.asset('assets/6416391.gif'),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            final random = Random();
            setState(() {
              _size = random.nextInt(200).toDouble()+100;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _size,
            height: _size,
            child: Image.asset('assets/6172512.gif'),
            curve: Curves.decelerate,
          ),
        ),
      )
    );
  }
}