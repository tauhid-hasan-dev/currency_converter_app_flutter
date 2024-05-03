import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 75, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Please enter an amount to convert to USD",
                hintStyle: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                prefixIcon: Icon(
                  Icons.monetization_on_outlined,
                ),
                prefixIconColor: Color.fromARGB(255, 151, 151, 151),
                filled: true,
                fillColor: Color.fromARGB(255, 46, 45, 45),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
