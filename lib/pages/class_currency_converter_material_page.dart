import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 160, 160, 160),
        width: 1.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 75, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Please enter an amount to convert to USD",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Color.fromARGB(255, 151, 151, 151),
                  filled: true,
                  fillColor: Color.fromARGB(255, 63, 62, 62),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Button clicked');
                  }
                },
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(10),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 3, 137, 126)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: const Text(
                  'Click me',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
