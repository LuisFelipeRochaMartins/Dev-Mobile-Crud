import 'package:database/models/ModelPadrao.dart';

class Endereco extends ModelPadrao{
  int? id;
  String? cidade;
  String? bairro;
  String? rua;
  String? numero;

  Endereco({
    this.id,
    required this.cidade,
    required this.bairro,
    required this.rua,
    this.numero
  });

  Endereco.fromMap(Map<String, dynamic> map) 
    : id = map['id'],
      cidade = map['cidade'],
      bairro = map['bairro'],
      rua    = map['rua'],
      numero = map['numero'];

  @override
  Map<String, Object?> toMap() {
    return {
      "id"          : id,
      "cidade"      : cidade,
      "bairro"      : bairro,
      "rua"         : rua,
      "numero"      : numero
    };
  }
}