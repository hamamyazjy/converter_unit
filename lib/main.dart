import 'package:currency_convert_app/lang/applocale.dart';
import 'package:currency_convert_app/provider/provider.dart';
import 'package:currency_convert_app/ui/screens/dashboard.dart';
import 'package:currency_convert_app/ui/screens/splash_screen.dart';
import 'package:currency_convert_app/ui/screens/welocme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');

  Widget _screen;
  if (seen == null || seen == false) {
    _screen = Welcome();
  } else {
    _screen = Dashboard();
  }

  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderClass>(
      create: (context) => ProviderClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Color(0xff261758),
          primaryColor: Color(0xff615192),
        ),
        home: SplashScreen(_screen),
        // home: Home(),
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [Locale('en', ''), Locale('ar', '')],
        localeResolutionCallback: (currentLocale, supportedLocale) {
          print(currentLocale.languageCode); // language device

          if (currentLocale != null) {
            for (Locale locale in supportedLocale) {
              if (currentLocale.languageCode == locale.languageCode) {
                return currentLocale;
              }
            }
          }
          return supportedLocale.first;
        },
      ),
    );
  }
}
  