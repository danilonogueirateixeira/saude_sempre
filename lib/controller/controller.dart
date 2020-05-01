import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mobx/mobx.dart';
import 'package:saude_sempre/models/contato.dart';
import 'package:saude_sempre/models/informacoes.dart';
import 'package:saude_sempre/models/medicamento.dart';
import 'package:saude_sempre/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_maintained/sms.dart';

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
  List<Contato> contatos = [];

  @observable
  bool isDuplicado = false;

  @observable
  bool dadosBaixados = true;

  @observable
  List<Medicamento> medicamentos = [];

  @observable
  bool isDuplicadoInfo = false;

  @observable
  bool dadosBaixadosInfo = true;

  @observable
  List<Informacoes> informacoes = [];

  @action
  sendSms(context) {
    SmsSender sender = new SmsSender();
    String mensagem = "";
    String mensagemInfo = "";
    String mensagemFinal = "";

    for (int i = 0; i < medicamentos.length; i++) {
      mensagem = mensagem +
          "${i + 1} - Nome: ${medicamentos[i].name} - desc: ${medicamentos[i].description} - freq: ${medicamentos[i].frequency}\n";
    }
    mensagem = "--- MEDICAMENTOS ---\n" + mensagem;

    for (int i = 0; i < informacoes.length; i++) {
      mensagemInfo = mensagemInfo +
          "${i + 1} - Titulo: ${informacoes[i].titulo} - desc: ${informacoes[i].descricao} - data: ${informacoes[i].data}\n";
    }
    mensagemInfo = "--- INFORMACOES ---\n" + mensagemInfo;

    mensagemFinal = mensagem + " " + mensagemInfo;

    print("--------------------");
    print(mensagemFinal.length);

    print((mensagemFinal.length / 160).floor());
    print("--------------------");

    switch ((mensagemFinal.length / 160).floor()) {
      case 0:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(contatos[i].numero, mensagemFinal));
        }
        break;
      case 1:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(
              contatos[i].numero, mensagemFinal.substring(0, 159)));
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(contatos[i].numero,
                mensagem.substring(160, mensagemFinal.length)));
          }
        }
        break;
      case 2:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(
              contatos[i].numero, mensagemFinal.substring(0, 159)));
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(160, 319)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(contatos[i].numero,
                mensagemFinal.substring(320, mensagemFinal.length)));
          }
        }
        break;
      case 3:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(
              contatos[i].numero, mensagemFinal.substring(0, 159)));
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(160, 319)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(320, 479)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(contatos[i].numero,
                mensagemFinal.substring(480, mensagemFinal.length)));
          }
        }
        break;

      case 4:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(
              contatos[i].numero, mensagemFinal.substring(0, 159)));
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(160, 319)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(320, 479)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(480, 639)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(contatos[i].numero,
                mensagemFinal.substring(640, mensagemFinal.length)));
          }
        }
        break;
      case 5:
        for (int i = 0; i < contatos.length; i++) {
          sender.sendSms(new SmsMessage(
              contatos[i].numero, mensagemFinal.substring(0, 159)));
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(160, 319)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(320, 479)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(480, 639)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(
                contatos[i].numero, mensagemFinal.substring(640, 799)));
          }
          for (int i = 0; i < contatos.length; i++) {
            sender.sendSms(new SmsMessage(contatos[i].numero,
                mensagemFinal.substring(800, mensagemFinal.length)));
          }
        }
        break;

      default:
    }

    // for (int i = 0; i < contatos.length; i++) {
    //   sender.sendSms(new SmsMessage(contatos[i].numero, mensagem));
    // }

    showToast(
      'Enviando SMS!',
      context: context,
      axis: Axis.vertical,
      position: StyledToastPosition.center,
      backgroundColor: Colors.green,
      animation: StyledToastAnimation.slideFromBottom,
    );
  }

  @action
  onTabTapped(int index) {
    currentIndex = index;
  }

  //SharedPreferences prefs;

  @action
  saveContatos(Contato contato) async {
    List<String> nomes = [];
    List<String> numeros = [];
    String nome = user.uid + "contatosNome";
    String numero = user.uid + "contatosNumero";

    for (int i = 0; i < contatos.length; i++) {
      nomes.add(contatos[i].nome);
      numeros.add(contatos[i].numero);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(nome, nomes);
    prefs.setStringList(numero, numeros);
  }

  @action
  getContatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<dynamic> nomesTemp = [];
    List<dynamic> numerosTemp = [];
    String nome = user.uid + "contatosNome";
    String numero = user.uid + "contatosNumero";

    nomesTemp = await prefs.get(nome);
    numerosTemp = await prefs.get(numero);

    if (nomesTemp != null) {
      List<Contato> contatosTemp = [];

      for (int i = 0; i < nomesTemp.length; i++) {
        contatosTemp.add(Contato(nomesTemp[i], numerosTemp[i]));
      }

      contatos = contatosTemp;
    }

    // await SharedPreferences.getInstance().then((value) {
    //   nomesTemp
    //       .add(Contato(value.get('contatosNome'), value.get('numeroContato')));
    // }).whenComplete(() {
    //   contatos = contatoTemp;
    // });
  }

  @action
  deleteContato(index) async {
    contatos.removeAt(index);
    List<String> nomes = [];
    List<String> numeros = [];
    String nome = user.uid + "contatosNome";
    String numero = user.uid + "contatosNumero";

    for (int i = 0; i < contatos.length; i++) {
      nomes.add(contatos[i].nome);
      numeros.add(contatos[i].numero);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(nome, nomes);
    prefs.setStringList(numero, numeros);
  }

  @action
  deleteContatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nome = user.uid + "contatosNome";
    String numero = user.uid + "contatosNumero";

    prefs.remove(nome);
    prefs.remove(numero);

    contatos.clear();
  }

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

    prefs.remove('uid');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('photo');

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
  updateData(String id, String uidUser, String name, String frequency,
      String description) {
    databaseReference.child(id).update({
      'idUser': uidUser,
      'name': name,
      'frequency': frequency,
      'description': description
    });

    getDados();
  }

  @action
  deleteData(String id) {
    databaseReference.child(id).remove();

    //medicamentos.remove(0);

    getDados();
  }

  @action
  getDados() {
    // dadosBaixados = true;

    databaseReference.once().then((DataSnapshot snapshot) {
      print('${snapshot.value}');

      //convertData(snapshot.value);

      Map teste = (snapshot.value);

      List<Medicamento> weightData = teste.entries
          .map((entry) => Medicamento(
              entry.key.toString(),
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

      if (medicamentosTemp.length > 0) {
        dadosBaixados = false;
      } else {
        dadosBaixados = true;
      }
    }).whenComplete(() {});
  }

  @action
  createRecordInfo(
      String uidUser, String titulo, String descricao, String data) {
    isDuplicadoInfo = false;

    for (int i = 0; i < informacoes.length; i++) {
      if (informacoes[i].uidUser == uidUser &&
          informacoes[i].titulo == titulo &&
          informacoes[i].descricao == descricao &&
          informacoes[i].data == data) {
        isDuplicadoInfo = true;
        break;
      }
    }
    if (isDuplicadoInfo) {
      print("-------- DADO DUPLICADO --------");
    } else {
      databaseReference.push().set({
        'idUserInfo': uidUser,
        'titulo': titulo,
        'descricao': descricao,
        'data': data,
      });
      getDadosInfo();
    }
  }

  @action
  updateDataInfo(
      String id, String uidUser, String titulo, String descricao, String data) {
    databaseReference.child(id).update({
      'idUserInfo': uidUser,
      'titulo': titulo,
      'descricao': descricao,
      'data': data
    });

    getDadosInfo();
  }

  @action
  deleteDataInfo(String id) {
    databaseReference.child(id).remove();

    //medicamentos.remove(0);

    getDadosInfo();
  }

  @action
  getDadosInfo() {
    //dadosBaixadosInfo = true;

    databaseReference.once().then((DataSnapshot snapshot) {
      print('${snapshot.value}');

      //convertData(snapshot.value);

      Map teste = (snapshot.value);

      List<Informacoes> weightData = teste.entries
          .map((entry) => Informacoes(
              entry.key.toString(),
              entry.value['idUserInfo'].toString(),
              entry.value['titulo'].toString(),
              entry.value['descricao'].toString(),
              entry.value['data'].toString()))
          .toList();

      print(teste);
      print(weightData);

      List<Informacoes> informacoesTemp = [];
      for (int i = 0; i < weightData.length; i++) {
        if (weightData[i].uidUser == user.uid) {
          informacoesTemp.add(weightData[i]);
        }
      }

      informacoes = informacoesTemp;

      if (informacoesTemp.length > 0) {
        dadosBaixadosInfo = false;
      } else {
        dadosBaixadosInfo = true;
      }
    }).whenComplete(() {});
  }
}
