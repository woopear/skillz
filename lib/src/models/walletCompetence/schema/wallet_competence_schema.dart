import 'dart:ffi';

class WalletCompetenceSchema{
  String? id;
  String idCompetence;
  String idLevel;
  
  WalletCompetenceSchema({
    this.id,
    required this.idCompetence,
    required this.idLevel,
  });

  factory WalletCompetenceSchema.formMap(Map<String, dynamic> data, documentId) {
    String idCompetence = data['idCompetence'];
    String idLevel = data['idLevel'];

    return WalletCompetenceSchema(
      id: documentId,
      idCompetence: idCompetence, 
      idLevel: idLevel
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCompetence': idCompetence,
      'idLevel': idLevel,
    };
  }
}