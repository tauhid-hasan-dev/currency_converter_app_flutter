import 'package:flutter/material.dart';

// we can not create mutable variable inside a statefulWidget because it has const cosntructor.
// but we can create mutable variable inside the class which is extended from the State() class.

//1.  Create a variable that stores the converted currency value.
//2.  Create a function that multiplies the value given by the textfield
//3.  Store the value in the variable that we created
//4.  Display the variable.

// Note: Build function should be less expensive as much as possible
// Mutable variable should not be used inside the build function

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPage();
}

class _CurrencyConverterPage extends State<CurrencyConverterPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void convert() {
      result = double.parse(textEditingController.text) * 80;
      setState(() {}); // setState triggers a rebuild using the build function
    }

    @override
    void dispose() {
      textEditingController.dispose();
      super.dispose();
    }

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
            Text(
              result.toString(),
              style: const TextStyle(
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
                onPressed: convert,
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
                  'Convert',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
