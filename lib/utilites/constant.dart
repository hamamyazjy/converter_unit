import 'package:currency_convert_app/lang/applocale.dart';
import 'package:flutter/material.dart';

TextStyle header1 = TextStyle(fontSize: 35);
TextStyle header2 = TextStyle(fontSize: 35, color: Colors.white);

var currencyNameList = ['USD', 'Jd', 'Egy', 'Nic'];

var currencyValueMap = {'USD': 3.5, 'Jd': 5, 'Egy': 0.21, 'Nic': 1};

var lengthNameList = ['m', 'cm', 'km', 'mel', 'feet', 'inch', 'yard'];

var lengthValueMap = {
  'm': 1,
  'cm': 0.01,
  'km': 1000,
  'mel': 1609.344,
  'feet': 0.3048,
  'inch': 39.37,
  'yard': 0.9144,
};

var timeNameList = ['sec', 'hour', 'min', 'day', 'week', 'month', 'year'];

var timeValueMap = {
  'sec': 1,
  'min': 60,
  'hour': 60 * 60,
  'day': 24 * 60 * 60,
  'week': 7 * 24 * 60 * 60,
  'month': 30 * 7 * 24 * 60 * 60,
  'year': 12 * 30 * 7 * 24 * 60 * 60,
};

var weightValueMap = {
  'gram': 1,
  'mili gram': 0.001,
  'kg': 1000,
  'ton': 1000 * 1000,
  'pound': 453.59237,
};
var weightNameList = ['gram', 'mili gram', 'kg', 'ton', 'pound'];

var memoryValueMap = {
  'unit': 1,
  'kilo': 1000,
  'Mega': 1000 * 1000,
  'Giga': 1000 * 1000 * 1000,
  'mili': 0.001,
  'micro': 0.000001,
  'nano': 0.000000001,
};
var memoryNameList = ['unit', 'kilo', 'Mega', 'Giga', 'mili', 'micro', 'nano'];

var temperatureNameList = ['C', 'F'];

typedef currencyConvertFun = Function(String value);
typedef onTapDrawerFun = Function(BuildContext context, int index);

// to trans
String getTranslateValue(BuildContext context, String key) {
  return AppLocale.of(context).getTranslate(key);
}

getTitle(BuildContext context, String key) {
  return '${getTranslateValue(context, 'convert')} ${getTranslateValue(context, key)}';
}
