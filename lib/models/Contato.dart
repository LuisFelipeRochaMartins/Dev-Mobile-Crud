import 'package:database/models/ModelPadrao.dart';

class Contato extends ModelPadrao{
  int?  id;
  String? name;
  String? phoneNumber;
  int? age;

  Contato({
    this.id, 
    required this.name,
    required this.phoneNumber,
    this.age
  });

  Map<String, Object?> toMap() {
    return {
      "id"          : id,
      "name"        : name,
      "phoneNumber" : phoneNumber,
      "age"         : age,
    };
  }
  
  @override
  Contato.fromMap(Map<String, dynamic> res) 
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        phoneNumber = res['phoneNumber'];
}