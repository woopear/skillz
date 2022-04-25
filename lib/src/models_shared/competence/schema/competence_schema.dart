

class CompetenceSchema{
  String? id;
  String libelle;
  String codeRome;
  String type;
  String? detail;
  
  CompetenceSchema({
    this.id,
    required this.libelle,
    required this.codeRome,
    required this.type,
    this.detail,
  });

  factory CompetenceSchema.formMap(Map<String, dynamic> data, documentId) {
    String libelle = data['libelle'];
    String codeRome = data['codeRome'];
    String type = data['type'];
    String detail = data['detail'] ?? '';

    return CompetenceSchema(
      id: documentId,
      libelle: libelle, 
      type: type, 
      detail: detail, 
      codeRome: codeRome
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'codeRome': codeRome,
      'type': type,
      'detail': detail ?? '',
    };
  }
}