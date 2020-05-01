import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/widgets/itemlist_widget.dart';

class MedicamentosWidget extends StatelessWidget {
  final Color color;
  final String image;

  MedicamentosWidget({this.color, this.image});

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);
    controller.getDados();

    return Observer(builder: (_) {
      print("----------------> builder list");

      //print(controller.medicamentos.length);

      return controller.dadosBaixados
          ? Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 16),
                  height: MediaQuery.of(context).size.height / 8.5,
                  child: Image.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Text(
                          "\n\n\n\n\nVocê não possui nenhum dado disponível!\n\n" +
                              "Adicione medicamentos e informações de seus realatórios médicos!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )),
                    ),
                  ),
                ),
              ],
            )
          : controller.medicamentos.isEmpty
              ? Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      height: MediaQuery.of(context).size.height / 8.5,
                      child: Image.asset(image),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.yellow),
                      )),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 8.6,
                      child: Image.asset(image),
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 16, left: 16),
                        child: ListView.builder(
                          itemCount: controller.medicamentos.length,
                          itemBuilder: (context, i) {
                            return Itemlist_widget(
                              controller: controller,
                              index: i,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
    });
  }
}
