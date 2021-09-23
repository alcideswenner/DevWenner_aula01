import 'package:aula_01/utils/config.dart';
import 'package:aula_01/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: name_app,
    routes: {
      "/": (context) => Home(),
    },
  ));
}
