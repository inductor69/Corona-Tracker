import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String country;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int critical;
  final int todayDeaths;
  final int todayCases;
  final int casesPerOneMillion;
  final int active;


  const Result({
    this.confirmed,
    this.country,
    this.deaths,
    this.recovered,
    this.active,
    this.casesPerOneMillion,
    this.critical,
    this.todayCases,
    this.todayDeaths
  });

  @override
  List<Object> get props => [
    country,
    confirmed,
    deaths,
    recovered,
    critical,
    active,
    todayCases,
    todayDeaths,
    casesPerOneMillion
  ];

  static Result fromJson(dynamic json) {
    return Result(
      country: json['country'],
      confirmed: json['cases'] as int,
      deaths: json['deaths'] as int,
      recovered: json['recovered'] as int,
      active: json['active'] as int,
      todayDeaths: json['todayDeaths'] as int,
      todayCases: json['todayCases'] as int,
      critical: json['critical'] as int,
      casesPerOneMillion: json['casesPerOneMillion'] as int
    );
  }
}