import 'package:database/Database.dart';
import 'package:database/models/Endereco.dart';
import 'package:flutter/material.dart';

class ViewCadastroEndereco extends StatefulWidget {
  const ViewCadastroEndereco({super.key});

  @override
  State<ViewCadastroEndereco> createState() => _ViewCadastroContato(); 
}

class _ViewCadastroContato extends State<ViewCadastroEndereco> {
  final _formKey = GlobalKey<FormState>();
  late DatabaseHandler database;
  Endereco newEndereco = Endereco(bairro: null, cidade: null, numero: null, rua: null);

  @override
  void initState() {
    super.initState();
    database = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Endereco"),
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
                prefixIcon: Icon(Icons.location_city),
                hintText: "Cidade"
              ),
              onChanged: (value) {
                setState(() => newEndereco.cidade = value);
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.house_outlined),
                  hintText: "Bairro"
                ),
                onChanged: (value) {
                  setState(() => newEndereco.bairro = value);
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.rotate_90_degrees_ccw),
                    hintText: "Rua"
                  ),
                onChanged: (value) {
                  setState(() => newEndereco.rua = value);
                },
              ),
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
                    hintText: "Número"
                  ),
                onChanged: (value) {
                  setState(() => newEndereco.numero = value);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      database.insertData('endereco', newEndereco);
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