import 'package:flutter/material.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_call),
            tooltip: "Adicionar novo Contato",
            onPressed: (() => Navigator.pushNamed(context, '/contatos')),
          ),
          IconButton(
            icon: const Icon(Icons.streetview),
            tooltip: "Adicionar novo Contato",
            onPressed: (() => Navigator.pushNamed(context, '/endereco')),
          ),
          IconButton(
            icon: const Icon(Icons.laptop),
            tooltip: "Adicionar novo Contato",
            onPressed: (() => Navigator.pushNamed(context, '/eletronico')),
          )
        ],
      ),
    );
  }
}