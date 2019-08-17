/*
//  UNIVERSIDAD ESTATAL A DISTANCIA
//  VICERRECTORÍA ACADÉMICA
//  ESCUELA DE CIENCIAS EXACTAS Y NATURALES
//  Proyecto Práctico
//  Sistemas Operativos
//  Código: 00881
//  Grupo: 01
//  Nombre: Abraham Oviedo Lorío
//  Cédula: 1-1372-0841
//  Centro Universitario: San José (01)
//  Fecha de creación del programa: 14/08/2019
//  Fecha de Entrega: 19 de abril del 2019
//  II Cuatrimestre. 2019
*/

import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new LoginPage(),
));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _InfoEstudiante {
  int cedula;
  int codigo_curso;
  int centro_universitario;
  double costo;
  double nota;
  String nombre_completo ='';
  String nombre_curso = '';
  String provincia = '';
  String cuatrimestre = '';


}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _InfoEstudiante _data = new _InfoEstudiante();

  String _validateField (String value) {
    if (value.length < 1) {
      return 'Requerido';
    }

    return null;
  }

  String _validateIntegers (String value)
  {
    try {
      if (int.parse(value) < 1) {
        return 'Requerido';
      }
    }
    catch (e) {
          return 'Número inválido';
    }
    return null;
  }

  String _validateDoubles (String value) {
    try {
      if (double.parse(value) < 1) {
        return 'Requerido';
      }
    }
    catch (e) {
      return 'Número inválido';
    }
    return null;
  }

  String _validateNota (String value) {
    try {
      if (double.parse(value) < 1 || double.parse(value) > 100) {
        return 'La nota debe ser un valor entre 1 y 100';
      }
    }
    catch (e) {
      return 'Digite un número';
    }
    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Se guardam los datos en la lista

      print('Mostrando datos almacenados');
      print('Cedula: ${_data.cedula}');
      print('Nombre: ${_data.nombre_completo}');
      print('Curso: ${_data.nombre_curso}');
      _confirmacionModal(context);
    }
  }
  Future<void> _confirmacionModal(BuildContext context) { //Muestra un modal cuando los datos se guardaron
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro Correcto'),
          content: const Text('Los datos se almacenaron correctamente'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registro de datos UNED'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    keyboardType: TextInputType.number, // Centro Universitario
                    decoration: new InputDecoration(
                        hintText: 'Ingrese código del CU',
                        labelText: 'Centro universitario'
                    ),
                    validator: this._validateIntegers,
                    onSaved: (String value){
                      this._data.centro_universitario = int.parse(value);
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.number, // Cedula
                    decoration: new InputDecoration(
                        hintText: 'Ingrese su cédula',
                        labelText: 'Cedula'
                    ),
                    validator: this._validateIntegers,
                    onSaved: (String value){
                      this._data.cedula = int.parse(value);
                  }
                ),
                new TextFormField(
                    keyboardType: TextInputType.text, // Nombre completo
                    decoration: new InputDecoration(
                        hintText: 'Ingrese su nombre y apellidos',
                        labelText: 'Nombre completo'
                    ),
                    validator: this._validateField,
                    onSaved: (String value){
                      this._data.nombre_completo = value;
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.text, // Provincia
                    decoration: new InputDecoration(
                        hintText: 'Ingrese su Provincia',
                        labelText: 'Provincia'
                    ),
                    validator: this._validateField,
                    onSaved: (String value){
                      this._data.provincia = value;
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.number, // Codigo del curso
                    decoration: new InputDecoration(
                        hintText: 'Ingrese código del curso',
                        labelText: 'Código'
                    ),
                    validator: this._validateIntegers,
                    onSaved: (String value){
                    this._data.codigo_curso = int.parse(value);
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.text, // Nombre del curso
                    decoration: new InputDecoration(
                        hintText: 'Ingrese el nombre del curso',
                        labelText: 'Curso'
                    ),
                    validator: this._validateField,
                    onSaved: (String value){
                      this._data.nombre_curso = value;
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.number, // Nota del curso
                    decoration: new InputDecoration(
                        hintText: 'Ingrese la nota del curso',
                        labelText: 'Nota del curso'
                    ),
                    validator: this._validateNota,
                    onSaved: (String value){
                      this._data.nota = double.parse(value);
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.text, // Cuatrimestre
                    decoration: new InputDecoration(
                        hintText: 'Ingrese el cuatrimestre',
                        labelText: 'Cuatrimestre'
                    ),
                    validator: this._validateField,
                    onSaved: (String value){
                      this._data.cuatrimestre = value;
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.number, // Costo de la materia
                    decoration: new InputDecoration(
                        hintText: 'Ingrese le costo de la materia',
                        labelText: 'Costo'
                    ),
                    validator: this._validateDoubles,
                    onSaved: (String value){
                      this._data.costo = double.parse(value);
                    }
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Guardar',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}