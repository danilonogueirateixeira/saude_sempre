import 'dart:async';
import 'dart:typed_data';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:masked_text/masked_text.dart';
import 'package:provider/provider.dart';
import 'package:saude_sempre/controller/controller.dart';
import 'package:saude_sempre/models/contato.dart';
import 'package:saude_sempre/models/user.dart';
import 'package:saude_sempre/widgets/itemlist_widget.dart';
import 'package:saude_sempre/widgets/navdrawer_widget.dart';
import 'package:toast/toast.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:rxdart/subjects.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    PlaceholderWidget(color: Colors.white, image: "assets/remedios_home.png"),
    PlaceholderWidget(color: Colors.white, image: "assets/infor_home.png"),
  ];

  TextEditingController medicamentoNameController = TextEditingController();
  TextEditingController medicamentoDescriptionController =
      TextEditingController();
  TextEditingController medicamentoFrequencyController =
      TextEditingController();

  TextEditingController contatoNomeController = TextEditingController();
  TextEditingController contatoNumeroController = TextEditingController();

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                print("_configureDidReceiveLocalNotificationSubject");
              },
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      print("_configureSelectNotificationSubject");
    });
  }

  Future<void> _showTimeoutNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'silent channel id',
        'silent channel name',
        'silent channel description',
        timeoutAfter: 3000,
        styleInformation: DefaultStyleInformation(true, true));
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'timeout notification',
        'Times out after 3 seconds', platformChannelSpecifics);
  }

  Future<void> _showDailyAtTime() async {
    print("notification time");
    var time = Time(16, 48, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'show daily title',
        'Daily notification shown at approximately 16:40:00',
        time,
        platformChannelSpecifics);
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> _repeatNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeating channel id',
        'repeating channel name',
        'repeating description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.EveryMinute, platformChannelSpecifics);
  }

  Future<void> _scheduleNotification() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(minutes: 1));
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        icon: 'app_icon',
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        largeIcon: DrawableResourceAndroidBitmap('app_icon'),
        vibrationPattern: vibrationPattern,
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> _showNotificationWithCustomTimestamp() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max,
        priority: Priority.High,
        showWhen: false,
        when: DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  void initState() {
    super.initState();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
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
    controller.getContatos();

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
                      "assets/smartphone.png",
                    ),
                    onPressed: () async {
                      controller.contatos.length > 0
                          ? controller.sendSms(controller.contatos, "", context)
                          : _showDialogSaveContato(controller);
                    }),
                IconButton(
                    tooltip: "Adicionar Informação Médica",
                    icon: Image.asset(
                      "assets/health-report.png",
                    ),
                    onPressed: () {}),
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

  _showDialogSaveContato(controller) {
    showToast(
      'Adicione um contato para o envio dos dados',
      context: context,
      axis: Axis.vertical,
      position: StyledToastPosition.center,
      backgroundColor: Colors.red,
      animation: StyledToastAnimation.slideFromBottom,
    );

    Timer(Duration(seconds: 2), () {
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
                      controller.contatos.add(Contato(
                          contatoNomeController.text,
                          contatoNumeroController.text));
                      controller.saveContatos(Contato(
                          contatoNomeController.text,
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
    });
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
              height: 215,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaskedTextField(
                    maskedTextFieldController: medicamentoNameController,
                    maxLength: 30,
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
                    mask: "xx",
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
                        return itemlist_widget(
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

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();
NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

Future<void> main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });
  runApp(
    MaterialApp(
      home: HomePage(
        user: null,
      ),
    ),
  );
}
