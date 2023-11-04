import 'package:database/Database.dart';
import 'package:database/models/Endereco.dart';
import 'package:flutter/material.dart';

class ViewEndereco extends StatefulWidget {
  const ViewEndereco({super.key});

  @override
  State<StatefulWidget> createState() => _ViewEndereco();
}

class _ViewEndereco extends State<ViewEndereco> {
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
        title: const Text("Endereço"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_home_rounded),
            tooltip: "Adicionar novo Endereço",
            onPressed: (() => Navigator.pushNamed(context, '/endereco/send')),
          )
        ],
      ),
      body: FutureBuilder(
        future: database.retrieveEnderecos(),
        builder: (BuildContext context, AsyncSnapshot<List<Endereco>> snapshot)  {
          if (snapshot.hasData) {
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
                    await database.deleteRegister('endereco',snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].cidade!),
                      subtitle: Text(snapshot.data![index].bairro!),
                  )),
                );
              }
            );
          } else {
            addAddress();
            return const Center(child: CircularProgressIndicator());
          }
        } 
      ),
    );
  }
  
  void addAddress() {
    Endereco newEndereco = Endereco(cidade: "Pouso Redondo", bairro: "Arno Siewerdt", rua: "Itajaí");
    database.insertData('endereco', newEndereco);
  }
}