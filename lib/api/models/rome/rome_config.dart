class RomeConfig {
  /// config api ROME
  static const configHeader = {
    'grant_type': 'client_credentials',
    'client_id':
        'PAR_numericacompetence_79609614ff88cfa5f1cf4031a8e24b4a59434b115b8318d409530ab916638fa5',
    'client_secret':
        '7acdff343f45d88cc6b3baa985900a480796f5996f6fa6a61a6f54f5013249bd',
    'scope':
        'application_PAR_numericacompetence_79609614ff88cfa5f1cf4031a8e24b4a59434b115b8318d409530ab916638fa5 api_romev1 nomenclatureRome',
  };

  static get urlBaseApiRome => 'https://entreprise.pole-emploi.fr';
  static get urlForConnexionApiRome => '/connexion/oauth2/access_token';
  static get realm => '/partenaire';
  static get contentTypeForRequestApiRome =>
      'application/x-www-form-urlencoded';
}
