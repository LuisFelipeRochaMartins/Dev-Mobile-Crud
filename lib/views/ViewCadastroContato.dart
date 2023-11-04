import 'package:database/Database.dart';
import 'package:database/models/Contato.dart';
import 'package:flutter/material.dart';

class ViewCadastroContato extends StatefulWidget {
  const ViewCadastroContato({super.key});

  @override
  State<ViewCadastroContato> createState() => _ViewCadastroContato(); 
}

class _ViewCadastroContato extends State<ViewCadastroContato> {
  final _formKey = GlobalKey<FormState>();
  late DatabaseHandler database;
  Contato newContato = Contato(name: null, phoneNumber: null);

  @override
  void initState() {
    super.initState();
    database = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Contatos"),
      ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
            const SizedBox(height: 10,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha este campo';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.contact_emergency),
                hintText: "Nome"
              ),
              onChanged: (value) {
                setState(() => newContato.name = value);
              },
            ),
              const SizedBox(height: 10,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor preencha este campo';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers_outlined),
                  hintText: "Número de Telefone"
                ),
                onChanged: (value) {
                  setState(() => newContato.phoneNumber = value);
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor preencha este campo';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers_outlined),
                    hintText: "Idade"
                  ),
                onChanged: (value) {
                  setState(() => newContato.age = int.parse(value));
                },
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    database.insertData('contato', newContato);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando Dados')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        )
      ),
    );
  }
}