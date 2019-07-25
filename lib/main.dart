import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:master/route.dart';
import 'package:master/util/all_translation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // Load File .env
  await DotEnv().load(".env");

  // Init Language default
  await allTranslations.init('en');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Translate Module
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: allTranslations.supportedLocales(),

      // Basic Module
      title: DotEnv().env['APP_NAME'],
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: routes,
    );
  }
}