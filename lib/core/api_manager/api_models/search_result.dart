class SearchResult {
  SearchResult({
      this.id, 
      this.name, 
      this.region, 
      this.country, 
      this.lat, 
      this.lon, 
      this.url,});

  SearchResult.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;
}