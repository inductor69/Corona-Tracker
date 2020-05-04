import 'dart:convert';

import 'package:covid19/model/result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CoronaApiClient {
  static const baseUrl = 'https://coronavirus-19-api.herokuapp.com';
  final http.Client httpClient;

  CoronaApiClient({@required this.httpClient}) : assert(httpClient != null); 
  
  Future<List<Result>> fetchUpdate() async {
    final latestUrl = '$baseUrl/countries';
    final response = await this.httpClient.get(latestUrl);
    List<Result> resList = List<Result>();
    if (response.statusCode != 200) {
      throw Exception('error getting latest updates');
    }

    final latestJson = jsonDecode(response.body);       
    for (var i = 0; i < latestJson.length; i++) {
      resList.add(Result.fromJson(latestJson[i]));
    }
    return resList;
  }

  Future<Map<String, double>> fetchLatest() async {
    final latestUrl = '$baseUrl/all';
    final res = await this.httpClient.get(latestUrl);
    final jsonRes = jsonDecode(res.body);
    Map<String, double> data = {
      'Death': jsonRes['deaths'] + 0.0,
      'Ongoing': jsonRes['cases'] - jsonRes['recovered'] + 0.0,
      'Recovered': jsonRes['recovered'] + 0.0,
    };
    return data;
  }
}
