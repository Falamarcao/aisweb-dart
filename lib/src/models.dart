class RotaerData {
  final String icao;
  final String name;
  final String city;
  final String uf;
  final double lat;
  final double lng;

  const RotaerData(
      {this.icao, this.name, this.city, this.uf, this.lat, this.lng});

  RotaerData.fromMap(Map<String, dynamic> data)
      : icao = data['AeroCode'],
        name = data['name'],
        city = data['city'],
        uf = data['uf'],
        lat = double.tryParse(data['lat'] ?? ''),
        lng = double.tryParse(data['lng'] ?? '');
}

enum AerodromesTypes { AD, HD, HP }
