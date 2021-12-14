// @dart=2.9

import 'package:flutter/material.dart';
import 'package:tiendaapp/screens/cliente_screen.dart';
import 'package:tiendaapp/screens/home_screen.dart';
import 'package:tiendaapp/screens/listaCliente_screen.dart';
import 'package:tiendaapp/screens/listaNegocio_screen.dart';
import 'package:tiendaapp/screens/lista_screen.dart';
import 'package:tiendaapp/screens/mapa_screen.dart';
import 'package:tiendaapp/screens/message_screen.dart';
import 'package:tiendaapp/screens/negocios_screen.dart';
import 'package:tiendaapp/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldState> mapaKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messagesStream.listen((message) {
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      print('My App: $message');
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TiendaApp',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MessageScreen(),
        'mapa': (_) => MapaScreen(),
        'cliente': (_) => ClienteScreen(),
        'negocio': (_) => NegociosScreen(),
        'lista': (_) => ListaScreen(),
        'listaCliente': (_) => ListaClienteScreen(),
        'listaNegocio': (_) => ListaNegocioScreen(),
      },
    );
  }
}
