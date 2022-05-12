class RomeService {
  /// creation ou modification du tokenAPi rome dans firebase
  Future<void> createOrUpdateTokenApiRome({bool update = false}) async {
    /// request api rome pour recuperer le token
    /// create ou update token dans setting.tokenApi
  }

  /// return le tokenApi rome
  Future<void> testAndFindTokenApiRome() async {
    /// recupere setting pour recuperer setting.tokenApi
    /// si setting.tokenApi == ''
    /// on se connect à l'api ROME recupere le token et le save dans firebase
    /// sinon on test si le token à expirer
    /// si oui on se reconnect à l'api ROME recupere le token et le save dans firebase
    /// sinon on continue
    /// return tokenAPi pour configurer le Bearer de l'entete
  }
}
