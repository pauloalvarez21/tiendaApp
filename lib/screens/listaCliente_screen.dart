import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaClienteScreen extends StatelessWidget {
  final firebaseInstance = FirebaseFirestore.instance;

  void leer_firebase() {
    firebaseInstance
        .collection("cliente")
        .doc("identificador_propio")
        .get()
        .then((value) {
      print(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Cliente'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          //Card Clientes
          Card(
            child: Center(
              child: ElevatedButton(
                child: Text('Lista'),
                onPressed: () {
                  leer_firebase();
                },
              ),
            ),
          ),
          Card(
            child: Center(
              child: Text('Carlos Martinez'),
            ),
          ),
          //Card Clientes
          Card(
            child: Center(
              child: Text('Pedro Gomez'),
            ),
          ),
          Card(
            child: Center(
              child: Text('Carol Mejia'),
            ),
          ),
        ],
      ),
    );
  }
}
