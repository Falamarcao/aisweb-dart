class RotaerData {
  final String aeroCode;
  final String name;
  final String city;
  final String uf;
  final double lat;
  final double lng;

  const RotaerData(
      {this.aeroCode, this.name, this.city, this.uf, this.lat, this.lng});

  RotaerData.fromMap(Map<String, dynamic> data)
      : aeroCode = data['AeroCode'],
        name = data['name'],
        city = data['city'],
        uf = data['uf'],
        lat = double.tryParse(data['lat'] ?? ''),
        lng = double.tryParse(data['lng'] ?? '');

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> params = {
      'aeroCode': aeroCode,
      'name': name,
      'city': city,
      'uf': uf,
      'lat': lat,
      'lng': lng
    };

    params
        .removeWhere((key, value) => value == null || value.toString().isEmpty);

    return params;
  }

  @override
  String toString() => this.toMap().toString();
}

enum AerodromesTypes { AD, HD, HP }
