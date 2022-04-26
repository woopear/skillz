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
}
