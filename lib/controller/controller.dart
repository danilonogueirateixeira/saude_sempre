import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:saude_sempre/models/medicamento.dart';
import 'package:saude_sempre/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class Controller = ControllerBase with _$Controller;

final databaseReference = FirebaseDatabase.instance.reference();

abstract class ControllerBase with Store {
  @observable
  int currentIndex = 0;

  @observable
  String uidUser = "";
  @observable
  User user;

  @observable
  bool isDuplicado = false;

  @observable
  List<Medicamento> medicamentos = [];

  @action
  onTabTapped(int index) {
    currentIndex = index;
  }

  //SharedPreferences prefs;

  @action
  saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('uid', user.uid);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('photo', user.photo);

    prefs.get('uid');
  }

  @action
  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();

    user = null;
  }

  @action
  Future<User> getUser() async {
    User userGet;
    await SharedPreferences.getInstance().then((value) {
      //uidUser = value.get('uidUser');
      userGet = User(value.get('uid'), value.get('name'), value.get('email'),
          value.get('photo'));

      // userGet.uid = value.get('uidUSer');
      // userGet.name = value.get('nameUser');
      // userGet.email = value.get('emailUser');
      // userGet.photo = value.get('photoUser');
      print(userGet);

      //uidUser = danilo;

      //print(danilo);
    }).whenComplete(() {
      user = userGet;
    });

    return user;
    // = await prefs.get('auth');
  }

  @action
  createRecord(
      String uidUser, String name, String frequency, String description) {
    isDuplicado = false;

    // if (medicamentos.length <= 0) {
    //   databaseReference.push().set({
    //     'idUser': uidUser,
    //     'name': name,
    //     'frequency': frequency,
    //     'description': description
    //   });
    //   getDados();
    // }

    for (int i = 0; i < medicamentos.length; i++) {
      if (medicamentos[i].uidUser == uidUser &&
          medicamentos[i].name == name &&
          medicamentos[i].frequency == frequency &&
          medicamentos[i].description == description) {
        isDuplicado = true;
        break;
      }
    }
    if (isDuplicado) {
      print("-------- DADO DUPLICADO --------");
    } else {
      databaseReference.push().set({
        'idUser': uidUser,
        'name': name,
        'frequency': frequency,
        'description': description
      });
      getDados();
    }
  }

  @action
  updateData(String child, String title, String description) {
    databaseReference
        .child(child)
        .update({'title': title, 'description': description});

    getDados();
  }

  @action
  deleteData(String child) {
    databaseReference.child(child).remove();

    medicamentos.remove(0);

    getDados();
  }

  @action
  getDados() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('${snapshot.value}');

      //convertData(snapshot.value);

      Map teste = (snapshot.value);

      List<Medicamento> weightData = teste.entries
          .map((entry) => Medicamento(
              entry.value['idUser'].toString(),
              entry.value['name'].toString(),
              entry.value['frequency'].toString(),
              entry.value['description'].toString()))
          .toList();

      print(teste);
      print(weightData);

      List<Medicamento> medicamentosTemp = [];
      for (int i = 0; i < weightData.length; i++) {
        if (weightData[i].uidUser == user.uid) {
          medicamentosTemp.add(weightData[i]);
        }
      }

      medicamentos = medicamentosTemp;
    });
  }
}
