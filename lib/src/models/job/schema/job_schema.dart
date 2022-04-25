class JobSchema {
  String? id; 
  String name; 
  String detail; 
  bool online;

  JobSchema({
    this.id,
    required this.name,
    required this.detail,
    required this.online
  });

  factory JobSchema.forMap(Map<String, dynamic> data, documentId) {
    String name = data['name'];
    String detail = data['detail'];
    bool online = data['online'];

    return JobSchema(
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