class CompanieProfilSchema{
  String? id;
  String denomination;
  String? filliale;
  String siret;
  String codeNaf;
  bool online;
  
  CompanieProfilSchema({
    this.id,
    required this.denomination,
    this.filliale,
    required this.siret,
    required this.codeNaf,
    required this.online,
  });

  factory CompanieProfilSchema.formMap(Map<String, dynamic> data, documentId) {
    String denomination = data['denomination'];
    String filliale = data['filliale'] ?? "";
    String siret = data['siret'];
    String codeNaf = data['codeNaf'];
    bool online = data['online'];

    return CompanieProfilSchema(
      id: documentId,
      denomination: denomination, 
      siret: siret, 
      codeNaf: codeNaf, 
      online: online, 
      filliale: filliale
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'denomination': denomination,
      'filliale': filliale ?? '',
      'siret': siret,
      'codeNaf': codeNaf,
      'online': online,
    };
  }
}