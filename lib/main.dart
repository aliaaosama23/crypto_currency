import 'package:currency_converter/screens/currency_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyScreen(),
    );
  }
}
