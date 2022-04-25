import 'dart:ffi';

class WorkstationSchema{
  String? id;
  String? name;
  bool online;
  List idCompetence;
  String? detail;
  
  WorkstationSchema({
    this.id,
    this.name,
    required this.online,
    required this.idCompetence,
    this.detail,
  });

  factory WorkstationSchema.formMap(Map<String, dynamic> data, documentId) {
    String name = data['name'] ?? '';
    bool online = data['online'];
    List idCompetence = data['idCompetence'];
    String detail = data['detail'] ?? '';

    return WorkstationSchema(
      id: documentId,
      name: name, 
      idCompetence: idCompetence, 
      detail: detail, 
      online: online
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'online': online,
      'idCompetence': idCompetence,
      'detail': detail ?? '',
    };
  }
}