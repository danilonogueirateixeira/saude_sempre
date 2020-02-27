import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:saude_sempre/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde Sempre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Container(
        color: Colors.red,
        child: SplashScreen.navigate(
          name: 'intro.flr',
          next: (context) => HomePage(),
          until: () => Future.delayed(Duration(seconds: 5)),
          startAnimation: '1',
        ),
      ),
    );
  }
}
