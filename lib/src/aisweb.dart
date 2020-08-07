import 'models.dart';

class AISWEB {
  String apiKey;
  String apiPass;
  String baseUrl;

  factory AISWEB(apiKey, apiPass, baseUrl) {
    baseUrl =
        'http://aisweb.decea.gov.br/api/?apiKey=$apiPass&apiPass=$apiPass';
    return AISWEB(apiKey, apiPass, baseUrl);
  }
}
