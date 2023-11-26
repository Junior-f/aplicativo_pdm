import 'package:aplicativo_pdm/screens/agenda.dart';
import 'package:aplicativo_pdm/screens/versiculos.dart';
import 'package:flutter/material.dart';
import 'package:aplicativo_pdm/screens/avisos.dart';
import 'package:aplicativo_pdm/screens/informacoes.dart';
import 'package:aplicativo_pdm/screens/inicial.dart';
import 'package:aplicativo_pdm/screens/login.dart';

var routes = <String, WidgetBuilder>{
  '/login': (BuildContext context) => const Login(),
  '/avisos': (BuildContext context) => const Avisos(),
  '/inicial': (BuildContext context) => const Inicial(),
  '/informacoes': (BuildContext context) => const Informacoes(),
  '/agenda': (BuildContext context) => const Agenda(),
  '/versiculos': (BuildContext context) => const Versiculos(),

};
