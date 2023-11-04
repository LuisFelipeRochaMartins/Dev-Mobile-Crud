import 'package:database/database.dart';
import 'package:database/models/Eletronico.dart';
import 'package:flutter/material.dart';

class ViewCadastroEletronico extends StatefulWidget {
  const ViewCadastroEletronico({super.key});
  
  @override
  State<StatefulWidget> createState() => _ViewCadastroContato();
}

class _ViewCadastroContato extends State<ViewCadastroEletronico> {
  final _formKey = GlobalKey<FormState>();
  late DatabaseHandler database;
  Eletronico newEletronico = Eletronico(name: null, categoria: null, valor: null);

  @override
  void initState() {
    super.initState();
    database = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Eletrônicos"),
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
                setState(() => newEletronico.name = value);
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
                  hintText: "Categoria"
                ),
                onChanged: (value) {
                  setState(() => newEletronico.categoria = value);
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
                    hintText: "Valor"
                  ),
                onChanged: (value) {
                  setState(() => newEletronico.valor = double.parse(value));
                },
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    database.insertData('eletronico', newEletronico);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando Dados')),
                    );
                    Navigator.popUntil(context, ModalRoute.withName('/'));
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