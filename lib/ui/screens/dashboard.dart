import 'package:currency_convert_app/model/item.dart';
import 'package:currency_convert_app/provider/provider.dart';
import 'package:currency_convert_app/utilites/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    addItems();
  }

  addItems() {
    items.add(Item(nameTile: 'Currency', iconTile: Icons.monetization_on));
    items.add(Item(nameTile: 'Length', iconTile: Icons.directions_walk));
    items.add(Item(nameTile: 'Time', iconTile: Icons.access_time));
    items.add(Item(nameTile: 'Temperature', iconTile: Icons.closed_caption));
    items.add(Item(nameTile: 'Weight', iconTile: Icons.nature_people));
    items.add(Item(nameTile: 'Memory', iconTile: Icons.memory));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          dashBack(),
          content(items, context),
        ],
      ),
    );
  }
}

Widget dashBack() {
  return Column(
    children: <Widget>[
      Expanded(
        child: Container(color: Color(0xff0087f3).withOpacity(0.9)),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );
}

Widget content(List<Item> items, BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        header(context),
        grid(items, context),
      ],
    ),
  );
}

Widget header(BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 30, right: 30, top: 30),
    title: Text(
      getTranslateValue(context, 'app_title'),
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    // subtitle: Text(
    //   '10 items',
    //   style: TextStyle(color: Colors.blue),
    // ),
    // trailing: CircleAvatar(),
  );
}

Widget grid(List<Item> items, BuildContext context) {
  ProviderClass pr = Provider.of(context);

  return Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: items
            .map((e) => GestureDetector(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(e.iconTile, size: 60),
                          SizedBox(height: 9),
                          Text(
                              getTranslateValue(
                                  context, 'title_${e.nameTile.toLowerCase()}'),
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    switch (e.nameTile) {
                      case 'Currency':
                        pr.setindex(0);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      case 'Length':
                        pr.setindex(1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      case 'Time':
                        pr.setindex(2);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      case 'Temperature':
                        pr.setindex(3);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      case 'Weight':
                        pr.setindex(4);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      case 'Memory':
                        pr.setindex(5);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                        break;
                      default:
                    }
                  },
                ))
            .toList(),
      ),
    ),
  );
}
