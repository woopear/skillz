class FirestorePath {
  /// setting
  static String settings() => 'settings';
  static String setting(String idSetting) => 'settings/$idSetting';

  /// articleCondition
  static String articlesCondition(String idCondition) =>
      'conditions/$idCondition/articles';
  static String articleCondition(String idCondition, String idArticle) =>
      'conditions/$idCondition/articles/$idArticle';
}
