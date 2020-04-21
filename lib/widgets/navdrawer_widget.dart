import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/pages/login_page.dart';

Future<void> _handleSignOut() async {
  await googleSignIn.signOut();

  var appDir = (await getTemporaryDirectory()).path;
  new Directory(appDir).delete(recursive: true);
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.red.shade900,
            child: Padding(
              padding: EdgeInsets.only(left: 63, right: 63),
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.red.shade900),
                child: Observer(builder: (_) {
                  return Container(
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(controller.user.photo),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    ),
                  );
                }),
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Text(
                  controller.user == null ? "null" : controller.user.name);
              //Text(controller.nomeUser == null ? "null" : controller.nomeUser),
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              //controller.uidUser = null;
              //controller.saveUser("", "", "", "");

              //controller.user = null;

              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new LoginPage();
              })).whenComplete(() {
                controller.deleteUser();
                try {
                  _handleSignOut();
                } catch (e) {
                  print(e);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
