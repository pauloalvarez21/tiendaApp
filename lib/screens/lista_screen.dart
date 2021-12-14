import 'package:flutter/material.dart';

class ListaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          //Card Clientes
          Card(
            child: Center(
              child: ElevatedButton(
                child: Text('Clientes'),
                onPressed: () {
                  Navigator.pushNamed(context, 'listaCliente');
                },
              ),
            ),
          ),
          //Card Clientes
          Card(
            child: Center(
              child: ElevatedButton(
                child: Text('Negocios'),
                onPressed: () {
                  Navigator.pushNamed(context, 'listaNegocio');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
