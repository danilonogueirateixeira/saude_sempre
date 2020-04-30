import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/pages/contacts_page.dart';
import 'package:saude_sempre/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sms_maintained/sms.dart';

const EVENTS_KEY = "fetch_events";

Future<void> _handleSignOut() async {
  await googleSignIn.signOut();

  var appDir = (await getTemporaryDirectory()).path;
  new Directory(appDir).delete(recursive: true);
}

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.red[900],
                  Colors.red[900],
                  Colors.red[800],
                  Colors.orange[900],
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 63, right: 63),
              child: DrawerHeader(
                //decoration: BoxDecoration(color: Colors.red.shade900),
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
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.yellow[500],
                      Colors.yellow[500],
                      Colors.yellow[400],
                      Colors.yellow[300],
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      controller.user == null ? "null" : controller.user.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(controller.user == null
                        ? "null"
                        : controller.user.email),
                  ],
                ),
              );
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
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.contacts,
              color: Colors.red.shade900,
            ),
            title: Text('Contatos Importantes'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactsPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red.shade900,
            ),
            title: Text('Sair'),
            onTap: () {
              //controller.uidUser = null;
              //controller.saveUser("", "", "", "");

              //controller.user = null;

              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new LoginPage();
              })).whenComplete(() {
                controller.deleteUser();
                controller.contatos = [];
                controller.medicamentos = [];
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
