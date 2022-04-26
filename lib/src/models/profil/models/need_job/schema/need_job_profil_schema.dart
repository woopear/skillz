class NeedJobProfilSchema {
  String? id; 
  String idCompetenceame; 
  String idLevel;

  NeedJobProfilSchema({
    this.id,
    required this.idCompetenceame,
    required this.idLevel,
  });

  factory NeedJobProfilSchema.fromMap(Map<String, dynamic> data, documentId) {
    String idCompetenceame = data['idCompetenceame'];
    String idLevel = data['idLevel'];

    return NeedJobProfilSchema(
      id: documentId,
      idCompetenceame: idCompetenceame, 
      idLevel: idLevel, 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCompetenceame': idCompetenceame,
      'idLevel': idLevel,
    };
  }
}