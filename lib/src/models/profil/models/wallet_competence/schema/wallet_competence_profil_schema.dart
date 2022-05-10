class WalletCompetenceProfilSchema{
  String? id;
  String idCompetence;
  String idLevel;
  
  WalletCompetenceProfilSchema({
    this.id,
    required this.idCompetence,
    required this.idLevel,
  });

  factory WalletCompetenceProfilSchema.formMap(Map<String, dynamic> data, documentId) {
    String idCompetence = data['idCompetence'];
    String idLevel = data['idLevel'];

    return WalletCompetenceProfilSchema(
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