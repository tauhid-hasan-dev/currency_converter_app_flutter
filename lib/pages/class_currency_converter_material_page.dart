import 'package:flutter/material.dart';

//1.  Create a variable that stores the converted currency value.
//2.  Create a function that multiplies the value given by the textfield
//3.  Store the value in the variable that we created
//4.  Display the variable.

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 116, 107),
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print(textEditingController);
                },
                // Instead of MaterialStatePropertyAll() we can use TextButton.styleFrom()
                style: TextButton.styleFrom(
                  elevation: (10),
                  backgroundColor: (const Color.fromARGB(255, 3, 116, 107)),
                  foregroundColor: (Colors.white),
                  shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  minimumSize: (const Size(double.infinity, 50)),
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
