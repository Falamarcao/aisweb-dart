import 'package:test/test.dart';

import 'private.dart';

import 'package:aisweb/aisweb.dart';

void main() {
  group('Rotaer', () {
    Rotaer rotaer = Rotaer(apiKey: apiKey, apiPass: apiPass);

    test('rotaer (aerodrome data)', () async {
      RotaerData aiswebResponse = await rotaer.getAerodrome('SNZR');

      expect(
          aiswebResponse.toString(),
          {
            'aeroCode': 'SNZR',
            'name': 'Pedro Rabelo de Souza',
            'city': 'Paracatu',
            'uf': 'MG',
            'lat': -17.243055555556,
            'lng': -46.881388888889
          }.toString());
      print(aiswebResponse);
    });

    test('rotaer (aerodromes list)', () async {
      List<RotaerData> aiswebResponse = await rotaer.getAerodromesList(
          city: 'Paracatu', uf: 'MG', type: AerodromesTypes.AD);

      expect(
          aiswebResponse.first.toString(),
          {
            'aeroCode': 'SNZR',
            'name': 'Pedro Rabelo de Souza',
            'city': 'Paracatu',
            'uf': 'MG',
            'lat': -17.243055555556,
            'lng': -46.881388888889
          }.toString());
      print(aiswebResponse.first);
    });
  });
}
