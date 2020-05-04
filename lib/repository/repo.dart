import 'package:covid19/model/result.dart';
import 'package:covid19/repository/api.dart';
import 'package:meta/meta.dart';

class CoronaRepository {
  final CoronaApiClient coronaApiClient;
  CoronaRepository({@required this.coronaApiClient}) : assert(coronaApiClient != null);
  Future<List<Result>> getUpdate() async {
    final List<Result> resList = await coronaApiClient.fetchUpdate();
    return resList;
  }

  Future<Map<String, double>> getLatest() async {
    final Map<String, double> res = await coronaApiClient.fetchLatest();
    return res;
  }
}