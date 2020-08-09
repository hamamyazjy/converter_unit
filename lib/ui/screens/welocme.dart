import 'package:currency_convert_app/model/pageModel.dart';
import 'package:currency_convert_app/ui/screens/dashboard.dart';
import 'package:currency_convert_app/utilites/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var view;

  _dataPageView() {
    view = List<PageModel>();
    view.add(PageModel('Currency', '', Icons.monetization_on, ''));
    view.add(PageModel('Length', '', Icons.directions_walk, ''));
    view.add(PageModel('Time', '', Icons.access_time, ''));
    view.add(PageModel('Temperature', '', Icons.closed_caption, ''));
    view.add(PageModel('Memory', '', Icons.nature_people, ''));
    view.add(PageModel('Weight', '', Icons.memory, ''));
  }

  var colors = [Colors.yellow, Colors.black87, Colors.blue, Colors.grey];
  final _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _dataPageView();
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Color(0xff6391ff).withGreen(200),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            body: PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(0, -90),
                            child: Icon(
                              view[index].icon,
                              size: 150,
                              color: Color(0xff6391ff),
                            ),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: getTranslateValue(
                                      context,
                                      'title_${view[index].title}'
                                          .toLowerCase())[0],
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6391ff)),
                                  children: [
                                TextSpan(
                                  text:
                                      '${getTranslateValue(context, 'title_${view[index].title}'.toLowerCase()).substring(1)} ${getTranslateValue(context, 'convert')}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ])),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                            ),
                            child: Text(
                              view[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: view.length,
              onPageChanged: (index) => _pageIndexNotifier.value = index,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicator(view.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff6391ff).withBlue(250),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(8.00, 8.00),
                          color: Color(0xff0087f3),
                          blurRadius: 50,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11.00),
                    ),
                    child: Center(
                      child: Text(
                        getTranslateValue(context, 'start'),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      //update seen
                      _updateSeen();
                      return Dashboard();
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _updateSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('seen', true);
}
