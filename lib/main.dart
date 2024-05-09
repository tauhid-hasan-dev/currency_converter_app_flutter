import 'package:currency_converter/pages/class_currency_converter_material_page.dart';
import 'package:flutter/material.dart';

// there is two type of importing in flutter
// 1. package importing or absolute importing
// 2. Relative importing

void main() {
  runApp(
      const MyAPP()); // we using const here to prevent recreating instances multiple times
}

// Types of widgets
// 1. StatelessWidget (states are immutable)
// 2. StatefulWidget (states are mutable inside the State object of the stateful widgets)
// 3. InheritedWidget

// We have two types of design
// 1. Material Design (is global thing )
// 2. Cupertino Design

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CurrencyConverterPage());
  }
}
