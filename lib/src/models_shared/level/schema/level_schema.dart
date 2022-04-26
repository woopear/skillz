class LevelSchema {
  String? id; 
  String libelle; 
  int level;

  LevelSchema({
    this.id,
    required this.libelle,
    required this.level,
  });

  factory LevelSchema.fromMap(Map<String, dynamic> data, documentId) {
    String libelle = data['libelle'];
    int level = data['level'];

    return LevelSchema(
      id: documentId,
      libelle: libelle, 
      level: level, 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'level': level,
    };
  }
}