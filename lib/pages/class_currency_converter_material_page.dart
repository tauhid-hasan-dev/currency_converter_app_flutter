import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

// we can not create mutable variable inside a statefulWidget because it has const cosntructor.
// but we can create mutable variable inside the class which is extended from the State() class.
// Note: Build function should be less expensive as much as possible
// Mutable variable should not be used inside the build function

//? Here’s a simplified illustration of where initState() fits into the widget lifecycle:
/* 
      1- Widget Creation (constructor is called)
      2- Initialization (initState() is called)
      3- Call super.initState() to inherit the parent class’s initialization.
      4- Perform any custom initialization such as data fetching or setting up listeners.
      5- Widget Building (build() method is called to describe the widget in terms of other lower-level widgets)
      6- Widget Rebuilding (if setState() is called, build() method is called again) 
    
*/

//? Project Algorithm
// 1.  Create a variable that stores the converted currency value.
// 2.  Create a function that multiplies the value given by the textfield
// 3.  Store the value in the variable that we created
// 4.  Display the variable.

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPage();
}

class _CurrencyConverterPage extends State<CurrencyConverterPage> {
  double result = 0;
  double conversionRate = 1;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCurrencyData();
  }

  Future<void> fetchCurrencyData() async {
    var url = Uri.parse('https://www.tcmb.gov.tr/kurlar/today.xml');
    // print("this is url----> $url");
    var response = await http.get(url);
    // print("this is response----> $response");
    var document = XmlDocument.parse(response.body);
    // print("this is document----> $document");
    var usdElement = document
        .findAllElements('Currency')
        .firstWhere((element) => element.getAttribute('Kod') == 'USD');
    // print("this is usdElement----> $usdElement");
    var usdRate = usdElement.findElements('ForexBuying').first.innerText;
    // print("this is usdElement----> $usdRate");
    setState(() {
      conversionRate = double.parse(usdRate);
    });
  }

  void convert() async {
    await fetchCurrencyData(); // Fetch latest currency rate before conversion
    double inputAmount = double.tryParse(textEditingController.text) ?? 0;
    result = inputAmount * conversionRate;
    setState(() {});
  }

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
              'TRY ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.white,
                ),
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
