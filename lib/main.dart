import 'package:flutter/material.dart';

void main() {
  runApp(
      const MyAPP()); // we using const here to prevent recreating instances multiple times
}

// Types of widgets
// 1. StatelessWidget (states are immutable)
// 2. StatefulWidget (states are mutable)
// 3. InheritedWidget

// We have two types of design
// 1. Material Design (is global thing )
// 2. Cupertino Design

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
         body: Center(
            child: Text("Tauhid Hasan"),
         )
      )
    );
  }
}
