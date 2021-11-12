import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          //Card Mapas
          Card(
            child: Center(
              child: ElevatedButton(
                child: Text('Mapa'),
                onPressed: () {
                  Navigator.pushNamed(context, 'mapa');
                },
              ),
            ),
          ),
          //Card cliente
          Card(
            child: Center(
              child: ElevatedButton(
                child: Text('Cliente'),
                onPressed: () {
                  Navigator.pushNamed(context, 'cliente');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
