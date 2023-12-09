import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class AppApiClient {
  AppApiClient({
    required http.Client httpClient,
  }) : _httpRetryClient = RetryClient(httpClient);

  static const _baseUrl = "https://restcountries.com/v3.1/all";

  final RetryClient _httpRetryClient;

  Future<http.Response> get() async {
    http.Response response = await _httpRetryClient.get(Uri.parse(_baseUrl));

    return response;
  }
}
