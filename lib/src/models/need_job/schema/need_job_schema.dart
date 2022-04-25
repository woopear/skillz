class NeedJobSchema {
  String? id; 
  String idCompetenceame; 
  String idLevel;

  NeedJobSchema({
    this.id,
    required this.idCompetenceame,
    required this.idLevel,
  });

  factory NeedJobSchema.forMap(Map<String, dynamic> data, documentId) {
    String idCompetenceame = data['idCompetenceame'];
    String idLevel = data['idLevel'];

    return NeedJobSchema(
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