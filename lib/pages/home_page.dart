import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/models/user.dart';
import 'package:saude_sempre/widgets/navdrawer_widget.dart';
import 'package:toast/toast.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    PlaceholderWidget(color: Colors.white, image: "assets/medicamentos.png"),
    PlaceholderWidget(color: Colors.white, image: "assets/remedios.png"),
  ];

  TextEditingController medicamentoNameController = TextEditingController();
  TextEditingController medicamentoDescriptionController =
      TextEditingController();
  TextEditingController medicamentoFrequencyController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);

    //controller.getUser().whenComplete(() {
    // print(controller.photoUser);
    //print(controller.nameUser);
    //});

    controller.getDados();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Observer(
        builder: (_) {
          controller.user = widget.user;
          // print(controller.photoUser);
          //print(controller.nameUser);

          return Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              title: Text("Saúde Sempre"),
              centerTitle: true,
              backgroundColor: Colors.red.shade900,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.onTabTapped,
              currentIndex: controller.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/medicine_bottom.png",
                    height: 30,
                  ),
                  title: Text(
                    "Remédios",
                    style: controller.currentIndex == 0
                        ? TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)
                        : TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/health-report.png",
                    height: 30,
                  ),
                  title: Text(
                    "Informações",
                    style: controller.currentIndex != 0
                        ? TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)
                        : TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            body: _children[controller.currentIndex],
            floatingActionButton: FabCircularMenu(
              alignment: Alignment.bottomRight,
              fabElevation: 5,
              fabOpenIcon: Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
              fabCloseIcon: Icon(
                Icons.close,
                size: 40,
                color: Colors.white,
              ),
              fabColor: Colors.red,
              fabOpenColor: Colors.red.shade900,
              fabCloseColor: Colors.red.shade900,
              ringColor: Colors.transparent,
              ringDiameter: 300,
              ringWidth: 100,
              children: <Widget>[
                // IconButton(
                //   icon: Icon(
                //     Icons.file_download,
                //     size: 30,
                //     color: Colors.yellow,
                //   ),
                //   onPressed: null,
                // ),
                IconButton(
                    tooltip: "Adicionar Medicamento",
                    icon: Image.asset(
                      "assets/medicine.png",
                    ),
                    onPressed: () {
                      // controller.createRecord(controller.uidUser, "Titulo 2",
                      //     "8 horas", "Descrição 2");

                      _showDialog(controller);
                    }),
                // IconButton(
                //   icon: Icon(
                //     Icons.file_download,
                //     size: 30,
                //     color: Colors.yellow,
                //   ),
                //   onPressed: null,
                // ),

                IconButton(
                    tooltip: "Atualizar Dados",
                    icon: Image.asset(
                      "assets/restart.png",
                    ),
                    onPressed: () {
                      controller.getDados();
                    }),
                IconButton(
                    tooltip: "Adicionar Informação Médica",
                    icon: Image.asset(
                      "assets/health-report.png",
                    ),
                    onPressed: () {
                      controller.updateData(
                          "4", "Sobrenome", "Danilo Nogueira Teixeira");
                      controller.getUser();
                    }),
                // IconButton(
                //   icon: Icon(
                //     Icons.file_download,
                //     size: 30,
                //     color: Colors.yellow,
                //   ),
                //   onPressed: null,
                // ),
                // IconButton(
                //     icon: Icon(Icons.delete),
                //     onPressed: () {
                //       controller.deleteData("6");
                //     }),
              ],
            ),
          );
        },
      ),
    );
  }

  _showDialog(controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return Observer(builder: (_) {
          return AlertDialog(
            title: new Text("Adicionar Medicamento"),
            content: Container(
              height: 200,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: medicamentoNameController,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  TextField(
                    controller: medicamentoDescriptionController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                  TextField(
                    controller: medicamentoFrequencyController,
                    decoration: InputDecoration(labelText: 'Frequência'),
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
                  "Adicionar",
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
                    controller.createRecord(
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

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String image;

  PlaceholderWidget({this.color, this.image});

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);

    return Observer(builder: (_) {
      //controller.getData();

      print("----------------> builder list");

      //print(controller.medicamentos.length);

      return controller.medicamentos.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 8.5,
                  child: Image.asset("assets/remedios.png"),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 8.5,
                  child: Image.asset("assets/remedios.png"),
                ),
                Container(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ListView.builder(
                    itemCount: controller.medicamentos.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 5,
                        child: Container(
                          height: 100,
                          padding: EdgeInsets.all(16),
                          color: Colors.yellow.shade400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    controller.medicamentos[i].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    controller.medicamentos[i].description,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "     de ",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      controller.medicamentos[i].frequency,
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "     em ",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      controller.medicamentos[i].frequency,
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
    });
  }
}

// ListTile(
//                     title: Text(
//                       controller.medicamentos[i].name,
//                     ),
//                     subtitle: Text(controller.medicamentos[i].description),

// Column(
//             children: <Widget>[
//               Container(
//                 color: Colors.yellow,
//                 height: 100,
//                 width: double.infinity,
//               ),
//               Container(
//                 child: Image.asset("assets/remedios.png"),
//               ),
//             ],
//           ),
