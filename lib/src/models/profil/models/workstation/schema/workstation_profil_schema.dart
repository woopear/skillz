
class WorkstationProfilSchema{
  String? id;
  String? name;
  bool online;
  List idCompetences;
  String? detail;
  
  WorkstationProfilSchema({
    this.id,
    this.name,
    required this.online,
    required this.idCompetences,
    this.detail,
  });

  factory WorkstationProfilSchema.formMap(Map<String, dynamic> data, documentId) {
    String name = data['name'] ?? '';
    bool online = data['online'];
    List idCompetences = data['idCompetences'];
    String detail = data['detail'] ?? '';

    return WorkstationProfilSchema(
      id: documentId,
      name: name, 
      idCompetences: idCompetences, 
      detail: detail, 
      online: online
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'online': online,
      'idCompetence': idCompetences,
      'detail': detail ?? '',
    };
  }
}