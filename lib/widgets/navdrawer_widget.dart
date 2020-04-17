import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saude_sempre/pages/login_page.dart';

Future<void> _handleSignOut() async {
  await googleSignIn.signOut();

  var appDir = (await getTemporaryDirectory()).path;
  new Directory(appDir).delete(recursive: true);
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // child:
            // Text(
            //   'Side menu',
            //   style: TextStyle(color: Colors.white, fontSize: 25),
            // ),
            decoration: BoxDecoration(
              color: Colors.red.shade900,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/remedios.png'),
              // ),
            ),
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
              try {
                _handleSignOut();
              } catch (e) {
                print(e);
              }
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
