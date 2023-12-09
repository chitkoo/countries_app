import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api_client/api_client.dart';
import '../models/country/country.dart';

class AppRepository {
  AppRepository({AppApiClient? appApiClient})
      : _appApiClient = appApiClient ?? AppApiClient(httpClient: http.Client());

  final AppApiClient _appApiClient;

  Future<List<Country>> getCountries() async {
    var response = await _appApiClient.get();

    List<Country> parseCountriesInIsolate(String responseBody) {
      return Country.parseCountries(responseBody);
    }

    return await compute(parseCountriesInIsolate, response.body);
  }
}
