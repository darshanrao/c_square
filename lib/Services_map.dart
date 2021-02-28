import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'map.dart';

Future<String> getJson() {
  return rootBundle.loadString('assets/map.json');
}

class Services3 {
  static Future<List<MapDatum>> getMap() async {
    try {
      var data = json.decode(await getJson());
      var rest = data["data"] as List;
      final List<MapDatum> map =
          rest.map<MapDatum>((json) => MapDatum.fromJson(json)).toList();
      return map;
    } catch (e) {
      return List<MapDatum>();
    }
  }
}
