import 'package:currency_convert_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderClass pr = Provider.of(context);
    return TextField(
        keyboardType: TextInputType.number,
        onChanged: (newValue) {
          pr.setValueTextField(newValue);
        },
        decoration: InputDecoration(
          fillColor: Colors.blue,
          //  labelText: 'Input',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}
