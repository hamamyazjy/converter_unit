import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:currency_convert_app/provider/provider.dart';
import 'package:currency_convert_app/ui/widgets/currency_piker.dart';
import 'package:currency_convert_app/ui/widgets/currency_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import '../../utilites/constant.dart';

class FirstHalfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    // print(size.width);
    // print(size.height);

    ProviderClass pr = Provider.of(context);

    ScreenUtil.init(width: 360, height: 780);

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: Color(0xff6391ff),
          ),
        ),
        Positioned(
          top: ScreenUtil().setHeight(120),
          right: ScreenUtil().setWidth(30),
          child: Container(
            height: ScreenUtil().setHeight(280),
            width: ScreenUtil().setWidth(300),
            decoration: BoxDecoration(
              color: Color(0xfff9fbff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(8.00, 8.00),
                  color: Color(0xff0087f3).withOpacity(0.23),
                  blurRadius: 50,
                ),
              ],
              borderRadius: BorderRadius.circular(11.00),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        getTranslateValue(context, 'from'),
                        style: TextStyle(fontSize: 20),
                        // ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        CurrencyPicker(
                            pr.setFromCurrencyConvert,
                            // pr.x == 0 ? currencyNameList : timeNameList),
                            pr.onTapdash()),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: CurrencyTextField()),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    getTranslateValue(context, 'to'),
                    style: TextStyle(fontSize: 20),
                    // ),
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    CurrencyPicker(pr.setToCurrencyConvert, pr.onTapdash()),
                    SizedBox(
                      width: 20,
                    ),
                    ClayContainer(
                      color: Color(0xff6391ff).withOpacity(0.9),
                      height: 50,
                      width: 140,
                      borderRadius: 50,
                      // emboss: true,
                      // depth: 40,
                      // spread: 16,
                      child: Center(
                        child: Text(
                          '${double.parse(pr.result).toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: header2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
