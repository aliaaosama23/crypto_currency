import 'dart:convert';

import 'package:currency_converter/models/currency_rate.dart';
import 'package:currency_converter/utilites/constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  Map<String, String> cryptoPrices = {};
  static String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future fetchCurrencyExchangeRateDependOnSelectedCurrency(
      String currencyQuote) async {
    for (String crypto in cryptoList) {
      final response = await http.get(Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currencyQuote?apikey=$kAPIKEY&time=$formattedDate'));

      if (response.statusCode == 200) {
        //print('returned body is ${response.body}'); // data as string
        print('decoded json ${jsonDecode(response.body)}'); // json
        cryptoPrices[crypto] = CurrencyRate.fromJson(jsonDecode(response.body))
            .rate
            .toStringAsFixed(0);
      } else {
        throw Exception('Failed to load rate data');
      }
      return cryptoPrices;
    }
  }
}

const List<String> currencyList = [
  "USD",
  //"JPY",
  "CNY",
  "CHF",
  "CAD",
  "MXN",
  "INR",
  "BRL",
  "RUB",
  "KRW",
  "IDR",
  "TRY",
  "SAR",
  "SEK",
  "NGN",
  "PLN",
  "ARS",
  "NOK",
  "TWD",
  "IRR",
  "AED",
  "COP",
  "THB",
  "ZAR",
  "DKK",
  "MYR",
  "SGD",
  "ILS",
  "HKD",
  "EGP",
  "PHP",
  "CLP",
  "PKR",
  "IQD",
  "DZD",
  "KZT",
  "QAR",
  "CZK",
  "PEN",
  "RON",
  "VND",
  "BDT",
  "HUF",
  "UAH",
  "AOA",
  "MAD",
  "OMR",
  "CUC",
  "BYR",
  "AZN",
  "LKR",
  "SDG",
  "SYP",
  "MMK",
  "DOP",
  "UZS",
  "KES",
  "GTQ",
  "URY",
  "HRV",
  "MOP",
  "ETB",
  "CRC",
  "TZS",
  "TMT",
  "TND",
  "PAB",
  "LBP",
  "RSD",
  "LYD",
  "GHS",
  "YER",
  "BOB",
  "BHD",
  "CDF",
  "PYG",
  "UGX",
  "SVC",
  "TTD",
  "AFN",
  "NPR",
  "HNL",
  "BIH",
  "BND",
  "ISK",
  "KHR",
  "GEL",
  "MZN",
  "BWP",
  "PGK",
  "JMD",
  "XAF",
  "NAD",
  "ALL",
  "SSP",
  "MUR",
  "MNT",
  "NIO",
  "LAK",
  "MKD",
  "AMD",
  "MGA",
  "XPF",
  "TJS",
  "HTG",
  "BSD",
  "MDL",
  "RWF",
  "KGS",
  "GNF",
  "SRD",
  "SLL",
  "XOF",
  "MWK",
  "FJD",
  "ERN",
  "SZL",
  "GYD",
  "BIF",
  "KYD",
  "MVR",
  "LSL",
  "LRD",
  "CVE",
  "DJF",
  "SCR",
  "SOS",
  "GMD",
  "KMF",
  "STD",
  "BTC",
  "XRP",
  "AUD",
  "BGN",
  "JOD",
  "GBP",
  "ETH",
  "EUR",
  "LTC",
  "NZD"
];

const List<String> cryptoList = [
  "BTC",
  "ETH",
  "LTC",
];
