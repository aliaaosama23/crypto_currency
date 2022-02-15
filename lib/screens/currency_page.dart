import 'dart:io';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/utilites/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyService service = CurrencyService();
  String currencySelected = currencyList[0];
  Map<String, String> convertedValues = {};
  @override
  void initState() {
    super.initState();
  }

  getCurrencyExchangeRateOnSelectCurrency(String value) async {
    Map<String, String> rate =
        await service.fetchCurrencyExchangeRateDependOnSelectedCurrency(value);
    setState(() {
      convertedValues = rate;
      //convertedValues.add(rate);
      currencySelected = value;
    });

    print(' currencySelected  is $currencySelected');
    print(' convertedValues  is $convertedValues');
  }

  Widget getMaterialDesignList(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.black.withOpacity(0.6),
      iconEnabledColor: Colors.white,
      value: currencySelected,
      items: currencyList
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  value,
                  style: kDropDownCurrencyStyle,
                ),
              ),
              value: value,
            ),
          )
          .toList(),
      onChanged: (value) {
        getCurrencyExchangeRateOnSelectCurrency(value!);
      },
    );
  }

  Widget getCupertinoDesgin() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (value) {
        getCurrencyExchangeRateOnSelectCurrency(currencyList[value]);
      },
      children: currencyList.map(
        (e) {
          return SizedBox(
            child: Text(
              e,
              style: kDropDownCurrencyStyle,
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        // height: 120,
        height: MediaQuery.of(context).size.height * 0.15,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Platform.isAndroid
            ? getMaterialDesignList(context)
            : getCupertinoDesgin(),
      ),
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.monetization_on_outlined,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Coin Ticker',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (String crypto in cryptoList)
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(18.0),
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('1 $crypto = ', style: kCurrencyStyle),
                  Text(convertedValues.isEmpty ? '?' : convertedValues[crypto]!,
                      style: kCurrencyStyle),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(currencySelected, style: kCurrencyStyle),
                ],
              ),
            )
        ],
      ),
    );
  }
}
