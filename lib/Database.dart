import 'package:database/models/Eletronico.dart';
import 'package:database/models/Endereco.dart';
import 'package:database/models/ModelPadrao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/Contato.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    return openDatabase(join(await getDatabasesPath(), 'devMobile.db'), 
    onCreate: (database, version) async {
      await database.execute(''' CREATE TABLE IF NOT EXISTS contato (
          id   INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          age  INTEGER,
          phoneNumber TEXT NOT NULL
          )'''
        );
      await database.execute(''' CREATE TABLE IF NOT EXISTS endereco (
        id     INTEGER PRIMARY KEY AUTOINCREMENT,
        cidade TEXT NOT NULL,
        bairro TEXT NOT NULL,
        rua    TEXT NOT NULL,
        numero TEXT
      )''');
      await database.execute(''' CREATE TABLE IF NOT EXISTS eletronico (
        id     INTEGER PRIMARY KEY AUTOINCREMENT,
        name   TEXT NOT NULL,
        categoria TEXT NOT NULL,
        valor  REAL
      )''');
    },
    version: 1, 
    );
  }

  Future<int> insertData(String tableName, ModelPadrao objeto) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert(tableName, objeto.toMap());
    return result;
  }

  Future<List<Contato>> retrieveContatos() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('contato');
    return queryResult.map((e) => Contato.fromMap(e)).toList();
  }

  Future<List<Endereco>> retrieveEnderecos() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('endereco');
    return queryResult.map((e) => Endereco.fromMap(e)).toList();
  }

  Future<List<Eletronico>> retrieveEletronicos() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Eletronico');
    return queryResult.map((e) => Eletronico.fromMap(e)).toList();
  }

  Future<void> deleteRegister(String tableName, int id) async {
    final db = await initializeDB();
    await db.delete(
      tableName, 
      where: "id = ?",
      whereArgs: [id]
    );
  }
}