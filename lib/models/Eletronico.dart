import 'package:database/models/ModelPadrao.dart';

class Eletronico extends ModelPadrao {
  int? id;
  String? name;
  String? categoria;
  double? valor;

  Eletronico({
      this.id, 
      required this.name,
      required this.categoria,
      required this.valor
  });

  Map<String, Object?> toMap() {
    return {
      "id"          : id,
      "name"        : name,
      "categoria"   : categoria,
      "valor"       : valor,
    };
  }
  
  @override
  Eletronico.fromMap(Map<String, dynamic> res) 
      : id = res["id"],
        name = res["name"],
        valor = res["valor"],
        categoria = res["categoria"];

}