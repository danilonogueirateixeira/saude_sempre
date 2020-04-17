import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:saude_sempre/models/medicamento.dart';
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
  String uidUser;

  @observable
  List<Medicamento> medicamentos = [];

  @action
  onTabTapped(int index) {
    currentIndex = index;
  }

  //SharedPreferences prefs;

  @action
  saveUser(String auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('auth', auth);
  }

  @action
  getUser() async {
    await SharedPreferences.getInstance().then((value) {
      String danilo = value.get('auth');
      print(danilo);
    });
    // = await prefs.get('auth');
  }

  @action
  createRecord(
      String uidUser, String name, String frequency, String description) {
    bool duplicado = false;

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
        duplicado = true;
        break;
      }
    }
    if (duplicado) {
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
        if (weightData[i].uidUser == uidUser) {
          medicamentosTemp.add(weightData[i]);
        }
      }

      medicamentos = medicamentosTemp;
    });
  }
}
