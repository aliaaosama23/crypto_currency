import 'dart:io';

import 'package:currency_converter/models/currency_rate.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/utilites/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://freecurrencyapi.net/api/v2/latest?apikey=
// 03b8e120-89b6-11ec-a55c-cb5a74769665
class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyService service = CurrencyService();
  String currencySelected = 'USD';
  List<String> convertedValues = ['?', '?', '?'];
  //String cryptoCurrency = 'BTC';
  List<Widget> allList = [];
  @override
  void initState() {
    super.initState();
    // getCurrencyExchangeRate();

    getCurrencyListExchange();
    // allList.add(
    //   Container(
    //     height: 120,
    //     //height: MediaQuery.of(context).size.height * 0.15,
    //     color: Colors.blue,
    //     alignment: Alignment.center,
    //     child:
    //         Platform.isAndroid ? getMaterialDesignList() : getCupertinoDesgin(),
    //   ),
    // );
  }

  // getCurrencyExchangeRate() async {
  //   CurrencyRate rate = await service.fetchCurrencyExchangeRate();
  //   print(rate.rate);
  //   setState(() {
  //     convertedValue = rate.rate.toStringAsFixed(0);
  //   });
  // }

  getCurrencyExchangeRateOnSelectCurrency(String value) async {
    for (String cryptoCurrency in cryptoList) {
      CurrencyRate rate =
          await service.fetchCurrencyExchangeRateDependOnSelectedCurrency(
              cryptoCurrency, value);
      setState(() {
        convertedValues.add(rate.rate.toStringAsFixed(0));
        currencySelected = value;
      });
      print('all convertedValues is $convertedValues');
    }
  }

  Widget getMaterialDesignList() {
    return DropdownButton<String>(
      dropdownColor: Colors.black.withOpacity(0.6),
      iconEnabledColor: Colors.white,
      // isExpanded: true,
      value: currencySelected,
      items: currencyList
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              child: SizedBox(
                //width: MediaQuery.of(context).size.width * 0.4,
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
        // print(value);
        // setState(() {
        //   currencySelected = value!;
        getCurrencyExchangeRateOnSelectCurrency(value!);
        // });
      },
    );
  }

  Widget getCupertinoDesgin() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (value) {
        // print('selected value ${currencyList[value]}');
        // setState(() {
        //   currencySelected = currencyList[value];
        // });

        print('getCupertinoDesgin selected item is $value');
        getCurrencyExchangeRateOnSelectCurrency(currencyList[value]);
      },
      children: currencyList.map(
        (e) {
          return SizedBox(
            //width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              e,
              style: kDropDownCurrencyStyle,
            ),
          );
        },
      ).toList(),
    );
  }

  getCurrencyListExchange() {
    for (var i = 0; i < cryptoList.length; i++) {
      allList.add(Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(18.0),
        margin: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1 ${cryptoList[i]} = ', style: kCurrencyStyle),
            Text(convertedValues[i], style: kCurrencyStyle),
            const SizedBox(
              width: 4,
            ),
            Text(currencySelected, style: kCurrencyStyle),
          ],
        ),
      ));
    }
    return allList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        // height: 120,
        height: MediaQuery.of(context).size.height * 0.15,
        color: Colors.blue,
        alignment: Alignment.center,
        child:
            Platform.isAndroid ? getMaterialDesignList() : getCupertinoDesgin(),
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
        children: allList,
      ),
    );
  }
}
