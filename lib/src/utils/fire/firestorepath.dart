class FirestorePath {
  /// setting
  static String settings() => 'settings';
  static String setting(String idSetting) => 'settings/$idSetting';

  /// condition
  static String conditions() => 'conditions';
  static String condition(String idCondition) => 'conditions/$idCondition';

  /// articleCondition
  static String articlesCondition(String idCondition) =>
      'conditions/$idCondition/articles';
  static String articleCondition(String idCondition, String idArticle) =>
      'conditions/$idCondition/articles/$idArticle';

  /// level
  static String levels() => 'levels';
  static String level(String idLevel) => 'levels/$idLevel';

  /// profil
  static String profils() => 'profils';
  static String profil(String idProfil) => 'profils/$idProfil';

  /// infoContact
  static String infoContacts() => 'infoContacts';
  static String infoContact(String idInfoContact) =>
      'infoContacts/$idInfoContact';

  /// competence
  static String competences() => 'competences';
  static String competence(String idCompetence) => 'competences/$idCompetence';

  /// walletCompetence
  static String walletCompetencesProfil(String idProfil) =>
      'profils/$idProfil/walletCompetences';
  static String walletCompetenceProfil(
          String idProfil, String idWalletCompetence) =>
      'profils/$idProfil/walletCompetences/$idWalletCompetence';

  /// workstation
  static String workstations(String idProfil) =>
      'profils/$idProfil/workstations';
  static String workstation(
          String idProfil, String idworkstation) =>
      'profils/$idProfil/workstations/$idworkstation';

  /// companie
  static String companie(String idProfil) => 'profils/$idProfil/companies';
  static String companieById(String idProfil, String idCompanie) =>
      'profils/$idProfil/companies/$idCompanie';

  /// job
  static String jobs(String idProfil) => 'profils/$idProfil/jobs';
  static String job(String idProfil, String idJobProfil) =>
      'profils/$idProfil/jobs/$idJobProfil';

  /// needJob
  static String needJobs(String idProfil, String idJobProfil) => 'profils/$idProfil/jobs/$idJobProfil/needJobs';
  static String needJob(String idProfil, String idJobProfil, String idNeedJobProfil) =>
      'profils/$idProfil/jobs/$idJobProfil/needJobs/$idNeedJobProfil';
}
