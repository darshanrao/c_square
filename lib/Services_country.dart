import 'dart:convert';

import 'package:http/http.dart' as http;
import 'country.dart';

class Services {
  //
  static const String url = 'https://c-square.000webhostapp.com/csquare2.0/databas.json';

  static Future<List<Datum>> getCountry() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        var data = json.decode(response.body);
        var rest = data["data"] as List;
        final List<Datum> country =
            rest.map<Datum>((json) => Datum.fromJson(json)).toList();
        return country;
      } else {
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }
}
