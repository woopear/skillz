
class WorkstationSchema{
  String? id;
  String? name;
  bool online;
  List idCompetences;
  String? detail;
  
  WorkstationSchema({
    this.id,
    this.name,
    required this.online,
    required this.idCompetences,
    this.detail,
  });

  factory WorkstationSchema.formMap(Map<String, dynamic> data, documentId) {
    String name = data['name'] ?? '';
    bool online = data['online'];
    List idCompetences = data['idCompetences'];
    String detail = data['detail'] ?? '';

    return WorkstationSchema(
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