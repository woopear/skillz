class RoleSchema {
  String libelle;
  String tag;

  RoleSchema({
    required this.libelle,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'tag': tag,
    };
  }

  Map<String, dynamic> root() {
    return {
      'libelle': "Createur de l'application",
      'tag': 'root',
    };
  }

  Map<String, dynamic> admin() {
    return {
      'libelle': "Gestionnaire de l'application",
      'tag': 'admin',
    };
  }

  Map<String, dynamic> rh() {
    return {
      'libelle': "Directeur ressource humaine",
      'tag': 'rh',
    };
  }

  Map<String, dynamic> manager() {
    return {
      'libelle': "Chef d'équipe",
      'tag': 'manager',
    };
  }

  Map<String, dynamic> collaborateur() {
    return {
      'libelle': "Personne avec un emploi dans une entreprise de l'application",
      'tag': 'collaborateur',
    };
  }

  Map<String, dynamic> candidat() {
    return {
      'libelle': "Personne sans emploi, recherchant un poste",
      'tag': 'candidat',
    };
  }
}
