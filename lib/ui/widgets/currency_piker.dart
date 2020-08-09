import 'package:currency_convert_app/utilites/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyPicker extends StatefulWidget {
  final currencyConvertFun currencyConvert;

  final List list1;

  CurrencyPicker(this.currencyConvert, this.list1);

  @override
  _CurrencyPickerState createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<CurrencyPicker> {
  var sValue;
  @override
  void initState() {
    super.initState();
    sValue = widget.list1[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: sValue,
      items: widget.list1
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (value) {
        widget.currencyConvert(value);

         setState(() {
          sValue = value;
        });
      },
      elevation: 8,
      underline: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
      ),
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
    );
          

                              
                              
    // return CupertinoPicker(
    //   itemExtent: 30,
    //   onSelectedItemChanged: (value) {
    //     currencyConvert(list1[value]);
    //   },
    //   children: list1.map((e) => Text(e)).toList(),
    // );
  }
}
