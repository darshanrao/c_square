// To parse this JSON data, do
//
//     final purpleMap = purpleMapFromJson(jsonString);

import 'dart:convert';

PurpleMap purpleMapFromJson(String str) => PurpleMap.fromJson(json.decode(str));

String purpleMapToJson(PurpleMap data) => json.encode(data.toJson());

class PurpleMap {
  PurpleMap({
    this.data,
  });

  List<MapDatum> data;

  factory PurpleMap.fromJson(Map<String, dynamic> json) => PurpleMap(
        data:
            List<MapDatum>.from(json["data"].map((x) => MapDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MapDatum {
  MapDatum({
    this.latitude,
    this.longitude,
    this.name,
  });

  double latitude;
  double longitude;
  String name;

  factory MapDatum.fromJson(Map<String, dynamic> json) => MapDatum(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
      };
}
