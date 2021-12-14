import 'package:flutter/material.dart';

class ListaNegocioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Negocio'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          //Card Clientes
          Card(
            child: Center(
              child: Text('Tienda el Buen Vecino'),
            ),
          ),
          //Card Clientes
          Card(
            child: Center(
              child: Text('Pollos Mejia'),
            ),
          ),
          //Card Clientes
          Card(
            child: Center(
              child: Text('Tienda Doña Ana'),
            ),
          ),
        ],
      ),
    );
  }
}
