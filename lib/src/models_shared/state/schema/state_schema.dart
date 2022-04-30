class StateSchema {
  String libelle;
  String tag;

  StateSchema({
    required this.libelle,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'tag': tag,
    };
  }

  factory StateSchema.waiting() {
    return StateSchema(
      libelle: 'email en attente de validation',
      tag: 'en attente',
    );
  }

  factory StateSchema.verify() {
    return StateSchema(
      libelle: 'email vérifié',
      tag: 'validé',
    );
  }

  factory StateSchema.bannis() {
    return StateSchema(
      libelle: 'utilisateur bannis',
      tag: 'bannis',
    );
  }

  factory StateSchema.archive() {
    return StateSchema(
      libelle: 'utilisateur archivé',
      tag: 'archivé',
    );
  }
}
