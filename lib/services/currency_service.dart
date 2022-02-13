// coin api
// API Key: A6DAE56F-9B8C-4B06-B366-791024DA9358

// end points
// https://rest.coinapi.io/v1/exchangerate/asset_id_base/asset_id_quote
// https://rest.coinapi.io/v1/exchangerate/BTC/USD
// https://rest.coinapi.io/v1/exchangerate/BTC
//https://rest.coinapi.io/v1/exchangerate/BTC/EUR?
// apikey=A6DAE56F-9B8C-4B06-B366-791024DA9358
// &time=2022-02-12T01:18:33.2000000Z
import 'dart:convert';

import 'package:currency_converter/models/currency_rate.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

const kAPIKEY = 'A6DAE56F-9B8C-4B06-B366-791024DA9358';

class CurrencyService {
  static String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Future<CurrencyRate> fetchCurrencyExchangeRate() async {
  //   final response = await http.get(Uri.parse(
  //       'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$kAPIKEY&time=$formattedDate'));
  //
  //   if (response.statusCode == 200) {
  //     print('returned body is ${response.body}');
  //     print('decoded json ${jsonDecode(response.body)}');
  //     return CurrencyRate.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load rate data');
  //   }
  // }

  Future<CurrencyRate> fetchCurrencyExchangeRateDependOnSelectedCurrency(
      String currencyBase, String currencyQuote) async {
    final response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$currencyBase/$currencyQuote?apikey=$kAPIKEY&time=$formattedDate'));
    print(
        'all url is : https://rest.coinapi.io/v1/exchangerate/$currencyBase/$currencyQuote?apikey=$kAPIKEY&time=$formattedDate');
    if (response.statusCode == 200) {
      print('returned body is ${response.body}');
      print('decoded json ${jsonDecode(response.body)}');
      return CurrencyRate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load rate data');
    }
  }
}

const List<String> currencyList = [
  "USD",
  "JPY",
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
