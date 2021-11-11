import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
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
        ],
      ),
    );
  }
}
