// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    this.data,
  });

  List<Datum> data;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.confirmedm1,
    this.recoveredm1,
    this.deathsm1,
    this.confirmedm2,
    this.recoveredm2,
    this.deathsm2,
    this.confirmedm3,
    this.recoveredm3,
    this.deathsm3,
    this.confirmedm4,
    this.recoveredm4,
    this.deathsm4,
    this.confirmedm5,
    this.recoveredm5,
    this.deathsm5,
    this.confirmedm6,
    this.recoveredm6,
    this.deathsm6,
    this.confirmedm7,
    this.recoveredm7,
    this.deathsm7,
  });

  String name;
  int confirmed;
  int recovered;
  int deaths;
  int confirmedm1;
  int recoveredm1;
  int deathsm1;
  int confirmedm2;
  int recoveredm2;
  int deathsm2;
  int confirmedm3;
  int recoveredm3;
  int deathsm3;
  int confirmedm4;
  int recoveredm4;
  int deathsm4;
  int confirmedm5;
  int recoveredm5;
  int deathsm5;
  int confirmedm6;
  int recoveredm6;
  int deathsm6;
  int confirmedm7;
  int recoveredm7;
  int deathsm7;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"] == null ? null : json["name"],
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        confirmedm1: json["confirmedm1"] == null ? null : json["confirmedm1"],
        recoveredm1: json["recoveredm1"] == null ? null : json["recoveredm1"],
        deathsm1: json["deathsm1"] == null ? null : json["deathsm1"],
        confirmedm2: json["confirmedm2"] == null ? null : json["confirmedm2"],
        recoveredm2: json["recoveredm2"] == null ? null : json["recoveredm2"],
        deathsm2: json["deathsm2"] == null ? null : json["deathsm2"],
        confirmedm3: json["confirmedm3"] == null ? null : json["confirmedm3"],
        recoveredm3: json["recoveredm3"] == null ? null : json["recoveredm3"],
        deathsm3: json["deathsm3"] == null ? null : json["deathsm3"],
        confirmedm4: json["confirmedm4"] == null ? null : json["confirmedm4"],
        recoveredm4: json["recoveredm4"] == null ? null : json["recoveredm4"],
        deathsm4: json["deathsm4"] == null ? null : json["deathsm4"],
        confirmedm5: json["confirmedm5"] == null ? null : json["confirmedm5"],
        recoveredm5: json["recoveredm5"] == null ? null : json["recoveredm5"],
        deathsm5: json["deathsm5"] == null ? null : json["deathsm5"],
        confirmedm6: json["confirmedm6"] == null ? null : json["confirmedm6"],
        recoveredm6: json["recoveredm6"] == null ? null : json["recoveredm6"],
        deathsm6: json["deathsm6"] == null ? null : json["deathsm6"],
        confirmedm7: json["confirmedm7"] == null ? null : json["confirmedm7"],
        recoveredm7: json["recoveredm7"] == null ? null : json["recoveredm7"],
        deathsm7: json["deathsm7"] == null ? null : json["deathsm7"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "confirmed": confirmed == null ? null : confirmed,
        "recovered": recovered == null ? null : recovered,
        "deaths": deaths == null ? null : deaths,
        "confirmedm1": confirmedm1 == null ? null : confirmedm1,
        "recoveredm1": recoveredm1 == null ? null : recoveredm1,
        "deathsm1": deathsm1 == null ? null : deathsm1,
        "confirmedm2": confirmedm2 == null ? null : confirmedm2,
        "recoveredm2": recoveredm2 == null ? null : recoveredm2,
        "deathsm2": deathsm2 == null ? null : deathsm2,
        "confirmedm3": confirmedm3 == null ? null : confirmedm3,
        "recoveredm3": recoveredm3 == null ? null : recoveredm3,
        "deathsm3": deathsm3 == null ? null : deathsm3,
        "confirmedm4": confirmedm4 == null ? null : confirmedm4,
        "recoveredm4": recoveredm4 == null ? null : recoveredm4,
        "deathsm4": deathsm4 == null ? null : deathsm4,
        "confirmedm5": confirmedm5 == null ? null : confirmedm5,
        "recoveredm5": recoveredm5 == null ? null : recoveredm5,
        "deathsm5": deathsm5 == null ? null : deathsm5,
        "confirmedm6": confirmedm6 == null ? null : confirmedm6,
        "recoveredm6": recoveredm6 == null ? null : recoveredm6,
        "deathsm6": deathsm6 == null ? null : deathsm6,
        "confirmedm7": confirmedm7 == null ? null : confirmedm7,
        "recoveredm7": recoveredm7 == null ? null : recoveredm7,
        "deathsm7": deathsm7 == null ? null : deathsm7,
      };
}
