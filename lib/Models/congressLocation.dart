class CongressLocation {
  int id;
  String title;
  double lat;
  double long;

  CongressLocation(int id, String title, double lat, double long) {
    this.id = id;
    this.title = title;
    this.lat = lat;
    this.long = long;
  }

  CongressLocation.fromJson(Map json)
      : id = int.parse(json['ID']),
        title = json['title'],
        lat = double.parse(json['lat']),
        long = double.parse(json['lon']);

  Map toJson() {
    return {'ID': id, 'title': title, 'lat': lat, 'lon': long};
  }
}