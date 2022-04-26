class JobProfilSchema {
  String? id; 
  String name; 
  String detail; 
  bool online;

  JobProfilSchema({
    this.id,
    required this.name,
    required this.detail,
    required this.online
  });

  factory JobProfilSchema.forMap(Map<String, dynamic> data, documentId) {
    String name = data['name'];
    String detail = data['detail'];
    bool online = data['online'];

    return JobProfilSchema(
      id: documentId,
      name: name, 
      detail: detail, 
      online: online,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'online': online,
    };
  }
}