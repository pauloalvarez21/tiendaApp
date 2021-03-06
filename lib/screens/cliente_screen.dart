import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClienteScreen extends StatefulWidget {
  const ClienteScreen({Key? key}) : super(key: key);

  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  String _nombre = '';
  String _direccion = '';
  String _telefono = '';
  String _celular = '';

  final firebaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Cliente'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _inputNombre(),
          Divider(),
          _inputDireccion(),
          Divider(),
          _inputTelefono(),
          Divider(),
          _inputCelular(),
          Divider(),
          _botonEnviar(),
        ],
      ),
    );
  }

  Widget _inputNombre() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nombre del cliente',
        labelText: 'Nombre del cliente',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _inputDireccion() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Dirección del cliente',
        labelText: 'Dirección del cliente',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _direccion = valor;
        });
      },
    );
  }

  Widget _inputTelefono() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Teléfono del cliente',
        labelText: 'Teléfono del cliente',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _telefono = valor;
        });
      },
    );
  }

  Widget _inputCelular() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Celular del cliente',
        labelText: 'Celular del cliente',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _celular = valor;
        });
      },
    );
  }

  Widget _botonEnviar() {
    return ElevatedButton(
      child: Text('Enviar'),
      onPressed: () {
        firebaseInstance.collection("cliente").add({
          "nombre": _nombre,
          "direccion": _direccion,
          "telefono": _telefono,
          "celular": _celular
        });

        openDialog();

        setState(() {
          _nombre = '';
          _direccion = '';
          _telefono = '';
          _celular = '';
        });
      },
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('El cliente fue creado con exito'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text('OK'))
            ],
          ));
}
