import 'package:currency_convert_app/provider/provider.dart';
import 'package:currency_convert_app/ui/screens/first_half_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  // final int indexdash;

  // Home({this.indexdash});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ProviderClass pr = Provider.of(context);
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff6391ff),
              title: Text(
                pr.onTapName(context).toString(),
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                FirstHalfScreen(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
