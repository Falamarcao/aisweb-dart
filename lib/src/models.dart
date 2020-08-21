class RotaerData {
  final String name;
  final String city;
  final String uf;
  final double lat;
  final double lng;

  const RotaerData({this.name, this.city, this.uf, this.lat, this.lng});

  RotaerData.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        city = data['city'],
        uf = data['uf'],
        lat = double.tryParse(data['lat'] ?? ''),
        lng = double.tryParse(data['lng'] ?? '');
}
