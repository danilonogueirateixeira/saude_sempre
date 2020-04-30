import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:masked_text/masked_text.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/models/contato.dart';
import 'package:saude_sempre/widgets/itemlistContacts_widget.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    controller.getContatos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos Importantes"),
        backgroundColor: Colors.red.shade900,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            alignment: Alignment.center,
            height: 200,
            child: Text(
              "Contatos definidos para o envio de SMS's com suas informações médicas!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.contatos.length,
                  itemBuilder: (context, i) {
                    return ItemlistContacts_widget(
                      controller: controller,
                      index: i,
                    );
                  },
                ),
              );
            },
          ),
          RaisedButton(
            child: Text("Adicionar Contato"),
            onPressed: () {
              _showDialogSaveContato(controller);
            },
          ),
        ],
      ),
    );
  }

  _showDialogSaveContato(controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return Observer(builder: (_) {
          return AlertDialog(
            title: new Text("Adicionar Contato"),
            content: Container(
              height: 215,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaskedTextField(
                    maskedTextFieldController: contatoNomeController,
                    maxLength: 20,
                    inputDecoration: new InputDecoration(
                        hintText: "Ex: Maria José", labelText: "Nome"),
                  ),
                  MaskedTextField(
                    maskedTextFieldController: contatoNumeroController,
                    mask: "(xx)xxxxx-xxxx",
                    maxLength: 14,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    inputDecoration: new InputDecoration(
                        hintText: "Ex: (99)99999-9999", labelText: "Número"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // define os botões na base do dialogo
              new FlatButton(
                child: new Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  contatoNomeController.text = "";
                  contatoNumeroController.text = "";
                },
              ),
              new FlatButton(
                child: new Text(
                  "Adicionar",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  if (contatoNomeController.text.isEmpty ||
                      contatoNumeroController.text.isEmpty) {
                    // Toast.show(
                    //     "É necessário preencher todas informações!", context,
                    //     duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);

                    showToast(
                      'É necessário preencher todas informações!',
                      context: context,
                      axis: Axis.vertical,
                      position: StyledToastPosition.center,
                      backgroundColor: Colors.red.shade900,
                      animation: StyledToastAnimation.slideFromBottom,
                    );
                  } else {
                    //Contato contato = ;
                    controller.contatos.add(Contato(contatoNomeController.text,
                        contatoNumeroController.text));
                    controller.saveContatos(Contato(contatoNomeController.text,
                        contatoNumeroController.text));
                    controller.getContatos();

                    showToast(
                      'Contatos adicionado com sucesso!',
                      context: context,
                      axis: Axis.vertical,
                      position: StyledToastPosition.center,
                      backgroundColor: Colors.green.shade900,
                      animation: StyledToastAnimation.slideFromBottom,
                    );
                    contatoNomeController.text = "";
                    contatoNumeroController.text = "";
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      },
    );
  }
}
