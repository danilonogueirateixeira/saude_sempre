import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/pages/login_page.dart';

import 'controller/controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        )
      ],
      child: MaterialApp(
        title: 'Saúde Sempre',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Container(
          color: Colors.red,
          child: SplashScreen.navigate(
            name: 'intro.flr',
            next: (context) => LoginPage(),
            until: () => Future.delayed(Duration(seconds: 5)),
            startAnimation: '1',
          ),
        ),
      ),
    );
  }
}
