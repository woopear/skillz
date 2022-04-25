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

  Map<String, dynamic> waiting() {
    return {
      'libelle': 'email en attente de validation',
      'tag': 'en attente',
    };
  }

  Map<String, dynamic> verify() {
    return {
      'libelle': 'email vérifié',
      'tag': 'validé',
    };
  }

  Map<String, dynamic> bannis() {
    return {
      'libelle': 'utilisateur bannis',
      'tag': 'bannis',
    };
  }

  Map<String, dynamic> archive() {
    return {
      'libelle': 'utilisateur archivé',
      'tag': 'archivé',
    };
  }
}
