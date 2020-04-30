import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:masked_text/masked_text.dart';

class itemlist_widget extends StatefulWidget {
  const itemlist_widget({
    Key key,
    @required this.controller,
    @required this.index,
  }) : super(key: key);

  final Controller controller;
  final int index;

  @override
  _itemlist_widgetState createState() => _itemlist_widgetState();
}

TextEditingController medicamentoNameController = TextEditingController();
TextEditingController medicamentoDescriptionController =
    TextEditingController();
TextEditingController medicamentoFrequencyController = TextEditingController();

class _itemlist_widgetState extends State<itemlist_widget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: GestureDetector(
        onTap: () {
          print(widget.controller.medicamentos[widget.index].name);
        },
        child: Card(
          elevation: 5,
          child: Container(
            height: 100,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.yellow[500],
                  Colors.yellow[400],
                  Colors.yellow[300],
                  Colors.yellow[200],
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.controller.medicamentos[widget.index].name,
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Container(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(
                        widget
                            .controller.medicamentos[widget.index].description,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontStyle: FontStyle.italic,
                            fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "a cada",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 14),
                      ),
                      Text(
                        " ${widget.controller.medicamentos[widget.index].frequency}",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
      // actions: <Widget>[
      //   IconSlideAction(
      //     caption: 'Archive',
      //     color: Colors.blue,
      //     icon: Icons.archive,
      //     onTap: null,
      //   ),
      //   IconSlideAction(
      //     caption: 'Share',
      //     color: Colors.indigo,
      //     icon: Icons.share,
      //     onTap: null,
      //   ),
      // ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.blue.shade900,
          icon: Icons.mode_edit,
          onTap: () {
            medicamentoNameController.text =
                widget.controller.medicamentos[widget.index].name;
            medicamentoFrequencyController.text =
                widget.controller.medicamentos[widget.index].frequency;
            medicamentoDescriptionController.text =
                widget.controller.medicamentos[widget.index].description;
            _showDialogUpdate(widget.controller,
                widget.controller.medicamentos[widget.index].id);
          },
        ),
        IconSlideAction(
          caption: 'Excluir',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => widget.controller
              .deleteData(widget.controller.medicamentos[widget.index].id),
        ),
      ],
    );
  }

  _showDialogUpdate(controller, id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return Observer(builder: (_) {
          return AlertDialog(
            title: new Text("Adicionar Medicamento"),
            content: Container(
              height: 215,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaskedTextField(
                    maskedTextFieldController: medicamentoNameController,
                    maxLength: 20,
                    inputDecoration: new InputDecoration(
                        hintText: "Ex: Losartana", labelText: "Nome"),
                  ),
                  MaskedTextField(
                    maskedTextFieldController: medicamentoDescriptionController,
                    maxLength: 100,
                    inputDecoration: new InputDecoration(
                        hintText: "Ex: Para controlar a pressão arterial",
                        labelText: "Descrição"),
                  ),
                  MaskedTextField(
                    maskedTextFieldController: medicamentoFrequencyController,
                    mask: "xx:xx",
                    maxLength: 5,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    inputDecoration: new InputDecoration(
                        hintText: "Ex: 08:00", labelText: "Frequência"),
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
                  medicamentoNameController.text = "";
                  medicamentoFrequencyController.text = "";
                  medicamentoDescriptionController.text = "";
                },
              ),
              new FlatButton(
                child: new Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  if (medicamentoNameController.text.isEmpty ||
                      medicamentoDescriptionController.text.isEmpty ||
                      medicamentoFrequencyController.text.isEmpty) {
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
                    controller.updateData(
                        id,
                        controller.user.uid,
                        medicamentoNameController.text,
                        medicamentoFrequencyController.text,
                        medicamentoDescriptionController.text);
                    controller.getDados();

                    if (controller.isDuplicado) {
                      showToast(
                        'Já existe um medicamento com as mesmas caracteristicas!',
                        context: context,
                        axis: Axis.vertical,
                        position: StyledToastPosition.center,
                        backgroundColor: Colors.red.shade900,
                        animation: StyledToastAnimation.slideFromBottom,
                      );
                    } else {
                      showToast(
                        'Medicamento adicionado com sucesso!',
                        context: context,
                        axis: Axis.vertical,
                        position: StyledToastPosition.center,
                        backgroundColor: Colors.green.shade900,
                        animation: StyledToastAnimation.slideFromBottom,
                      );
                      medicamentoNameController.text = "";
                      medicamentoFrequencyController.text = "";
                      medicamentoDescriptionController.text = "";
                      Navigator.of(context).pop();
                    }
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
