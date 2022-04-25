import 'dart:ffi';

class CompanieSchema{
  String? id;
  String denomination;
  String? filliale;
  String siret;
  String codeNaf;
  Bool online;
  
  CompanieSchema({
    this.id,
    required this.denomination,
    this.filliale,
    required this.siret,
    required this.codeNaf,
    required this.online,
  });

  factory CompanieSchema.formMap(Map<String, dynamic> data, documentId) {
    String denomination = data['denomination'];
    String filliale = data['filliale'] ?? "";
    String siret = data['siret'];
    String codeNaf = data['codeNaf'];
    Bool online = data['online'];

    return CompanieSchema(
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