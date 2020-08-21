import 'package:aisweb/aisweb.dart';
import 'package:meta/meta.dart' show required;

import 'aisweb.dart';

class Rotaer extends AISWEB {
  Rotaer({@required String apiKey, @required String apiPass})
      : super(apiKey: apiKey, apiPass: apiPass, area: 'rotaer');

  Future<RotaerData> getAerodromeData(String icaoCode) async =>
      RotaerData.fromMap(await get('&icaoCode=$icaoCode'));
}
