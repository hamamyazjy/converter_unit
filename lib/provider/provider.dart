import 'package:currency_convert_app/utilites/constant.dart';
import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier {
  String title = '';
  String result = '0';

  String fromCurrencyConvert = 'USD';

  String toCurrencyConvert = 'USD';

  int value = 0;
  List list = currencyNameList;

  int x = 0;

  setindex(int w) {
    this.x = w;
    print(x);
  }

  onTapdash() {
    switch (this.x) {
      case 0:
        return this.list = currencyNameList;

        break;
      case 1:
        return this.list = lengthNameList;
        break;
      case 2:
        return this.list = timeNameList;
        break;
      case 3:
        return this.list = temperatureNameList;
        break;
      case 4:
        return this.list = weightNameList;
        break;
      case 5:
        return this.list = memoryNameList;
        break;
    }
    notifyListeners();
  }

  onTapName(BuildContext context) {
    switch (this.x) {
      case 0:
        return this.title = getTitle(context, 'title_currency');

        break;
      case 1:
        return this.title = getTitle(context, 'title_length');
        break;
      case 2:
        return this.title = getTitle(context, 'title_time');
        break;
      case 3:
        return this.title = getTitle(context, 'title_temperature');
        break;
      case 4:
        return this.title = getTitle(context, 'title_weight');
        break;
      case 5:
        return this.title = getTitle(context, 'title_memory');
        break;
    }
    notifyListeners();
  }

  void setFromCurrencyConvert(String value) {
    this.fromCurrencyConvert = value;
    print(fromCurrencyConvert);
    calculate();
  }

  void setToCurrencyConvert(String value) {
    this.toCurrencyConvert = value;
    print(toCurrencyConvert);

    calculate();
  }

  void setValueTextField(String value) {
    this.value = int.parse(value);
    print(value);

    calculate();
  }

  calculate() {
    // toStringAsFixed(fractionDigits)
    result = currencyNameList.contains(fromCurrencyConvert) &&
            currencyNameList.contains(toCurrencyConvert)
        ? '${currencyValueMap[fromCurrencyConvert] / currencyValueMap[toCurrencyConvert] * value}'
        : lengthNameList.contains(fromCurrencyConvert) &&
                lengthNameList.contains(toCurrencyConvert)
            ? '${lengthValueMap[fromCurrencyConvert] / lengthValueMap[toCurrencyConvert] * value}'
            : timeNameList.contains(fromCurrencyConvert) &&
                    timeNameList.contains(toCurrencyConvert)
                ? '${timeValueMap[fromCurrencyConvert] / timeValueMap[toCurrencyConvert] * value}'
                : weightNameList.contains(fromCurrencyConvert) &&
                        weightNameList.contains(toCurrencyConvert)
                    ? '${weightValueMap[fromCurrencyConvert] / weightValueMap[toCurrencyConvert] * value}'
                    : memoryNameList.contains(fromCurrencyConvert) &&
                            memoryNameList.contains(toCurrencyConvert)
                        ? '${memoryValueMap[fromCurrencyConvert] / memoryValueMap[toCurrencyConvert] * value}'
                        : (fromCurrencyConvert == 'C' &&
                                    toCurrencyConvert == 'C') ||
                                (fromCurrencyConvert == 'F' &&
                                    toCurrencyConvert == 'F')
                            ? '$value'
                            : fromCurrencyConvert == 'F' &&
                                    toCurrencyConvert == 'C'
                                ? '${(value - 32) / 1.8}'
                                : '${value * 1.8 + 32}';

    print('$result result');
    notifyListeners();
  }
}
