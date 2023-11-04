import 'package:database/database.dart';
import 'package:database/models/Eletronico.dart';
import 'package:flutter/material.dart';

class ViewEletronico extends StatefulWidget {
  const ViewEletronico({super.key});
  
  @override
  State<StatefulWidget> createState() => _ViewEletronico();
}

class _ViewEletronico extends State<ViewEletronico> {
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
        title: const Text("Eletrônico"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings_cell_sharp),
            tooltip: "Adicionar novo Eletrônico",
            onPressed: (() => Navigator.pushNamed(context, '/eletronico/send')),
          )
        ],
      ),
      body: FutureBuilder(
        future: database.retrieveEletronicos(),
        builder: (BuildContext context, AsyncSnapshot<List<Eletronico>> snapshot)  {
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
                    await database.deleteRegister('eletronico',snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].name!),
                      subtitle: Text(snapshot.data![index].valor.toString()),
                  )),
                );
              }
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/eletronico/send'),
                child: const Text("Adiciona novo Eletrônico"),
              ),
            );
          }
        } 
      ),
    );
  }
}