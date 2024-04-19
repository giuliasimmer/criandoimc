import 'package:flutter/material.dart';
import 'package:imc/home.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green), 
      home: const HomeIMC()
    ));
}