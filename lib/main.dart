import 'package:database/Views/ViewCadastroContato.dart';
import 'package:database/Views/ViewHome.dart';
import 'package:database/views/ViewCadastroEletronico.dart';
import 'package:database/views/ViewCadastroEndereco.dart';
import 'package:database/views/ViewContato.dart';
import 'package:database/views/ViewEletronico.dart';
import 'package:database/views/ViewEndereco.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Contatos',
    initialRoute: '/',
    theme: ThemeData.dark(),
    routes: {
      '/'                : (context) => const ViewHome(),
      '/contatos'        : (context) => const ViewContato(),
      '/endereco'        : (context) => const ViewEndereco(),
      '/eletronico'      : (context) => const ViewEletronico(), 
      '/contatos/send'   : (context) => const ViewCadastroContato(),
      '/endereco/send'   : (context) => const ViewCadastroEndereco(),
      '/eletronico/send' : (context) => const ViewCadastroEletronico(),
    },
  ));
}
