import 'package:database/database.dart';
import 'package:database/models/Contato.dart';
import 'package:flutter/material.dart';

class ViewContato extends StatefulWidget {
  const ViewContato({super.key});
  
  @override
  State<ViewContato> createState() =>  _ViewContato();
}

class _ViewContato extends State<ViewContato> {
  late DatabaseHandler database;

  @override
  void initState() {
    super.initState();
    database = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.contact_page),
            tooltip: "Adicionar novo Contato",
            onPressed: (() => Navigator.pushNamed(context, '/contatos/send')),
          )
        ],
      ),
      body: FutureBuilder(
        future: database.retrieveContatos(),
        builder: (BuildContext context, AsyncSnapshot<List<Contato>> snapshot)  {
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int> (snapshot.data![index].id!),
                  onDismissed: (DismissDirection direction) async {
                    await database.deleteRegister('contato',snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].name!),
                      subtitle: Text(snapshot.data![index].phoneNumber.toString()),
                  )),
                );
              }
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/contato/send'),
                child: const Text("Adiciona novo Contato"),
              ),
            );
          }
        } 
      ),
    );
  }
}