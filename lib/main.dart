import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TiendaApp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TiendaApp'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello Word'),
          ),
        ),
      ),
    );
  }
}
