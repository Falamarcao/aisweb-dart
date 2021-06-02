library aisweb.rotaer;

import 'package:meta/meta.dart' show required;

import 'aisweb.dart';
import 'models.dart';

class Rotaer extends AISWEB {
  Rotaer({@required String apiKey, @required String apiPass})
      : super(apiKey: apiKey, apiPass: apiPass, area: 'rotaer');

  Future<RotaerData> getAerodrome(String icaoCode) async =>
      RotaerData.fromMap(await get({'icaoCode': icaoCode}));

  Future<List<RotaerData>> getAerodromesList({
    int rowStart = 0,
    int rowEnd = 1,
    String name,
    String city,
    String uf,
    AerodromesTypes type,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'rowStart': rowStart.toString(),
      'rowEnd': rowEnd.toString(),
      'name': name,
      'city': city,
      'uf': uf,
    };

    Map<String, dynamic> data = await get(queryParameters);
    data = data['rotaer'];

    if (data != null) {
      final dynamic response = data['item'];

      List<RotaerData> results = [];
      if (response is List) {
        response.forEach((element) => results.add(RotaerData.fromMap(element)));
        return results;
      } else
        return [RotaerData.fromMap(response)];
    }

    return null;
  }
}
