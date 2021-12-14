import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({Key? key}) : super(key: key);

  @override
  _NegociosScreenState createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  String _nombre = '';
  String _direccion = '';
  String _geo = '';
  String _telefono = '';
  String _celular = '';
  String _web = '';
  String _productos = '';

  final firebaseInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Negocio'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _inputNombre(),
          Divider(),
          _inputDireccion(),
          Divider(),
          _inputGeo(),
          Divider(),
          _inputTelefono(),
          Divider(),
          _inputCelular(),
          Divider(),
          _inputWeb(),
          Divider(),
          _inputProductos(),
          Divider(),
          _botonEnviar()
        ],
      ),
    );
  }

  Widget _inputNombre() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Nombre del negocio',
        labelText: 'Nombre del negocio',
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Dirección del negocio',
        labelText: 'Dirección del negocio',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _direccion = valor;
        });
      },
    );
  }

  Widget _inputGeo() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Geolocalización del negocio',
        labelText: 'Geolocalización del negocio',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _geo = valor;
        });
      },
    );
  }

  Widget _inputTelefono() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Teléfono del negocio',
        labelText: 'Teléfono del negocio',
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
        hintText: 'Celular del negocio',
        labelText: 'Celular del negocio',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _celular = valor;
        });
      },
    );
  }

  Widget _inputWeb() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Página web del negocio',
        labelText: 'Página web del negocio',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _web = valor;
        });
      },
    );
  }

  Widget _inputProductos() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'Productos del negocio',
        labelText: 'Productos del negocio',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _productos = valor;
        });
      },
    );
  }

  Widget _botonEnviar() {
    return ElevatedButton(
      child: Text('Enviar'),
      onPressed: () {
        firebaseInstance.collection("negocio").add({
          "nombre": _nombre,
          "direccion": _direccion,
          "telefono": _telefono,
          "celular": _celular,
          "geo": _geo,
          "web": _web,
          "productos": _productos
        });
      },
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('El negocio fue creado con exito'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text('OK'))
            ],
          ));
}
