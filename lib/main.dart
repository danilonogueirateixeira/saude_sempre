import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/pages/home_page.dart';
import 'package:saude_sempre/pages/login_page.dart';

import 'controller/controller.dart';

Controller controller = Controller();

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
        home: Observer(builder: (_) {
          return Container(
            color: Colors.red,
            child: SplashScreen.navigate(
              name: 'intro.flr',

              // next: ,
              until: controller.getUser,
              startAnimation: '1',
              next: controller.user == null
                  ? (context) => LoginPage()
                  : controller.user.uid == null
                      ? (context) => LoginPage()
                      : (context) => HomePage(user: controller.user),
            ),
          );
        }),
      ),
    );
  }
}
