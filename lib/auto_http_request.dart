library auto_http_request;

import 'dart:convert';
import 'package:http/http.dart' as http;

/// A client for making HTTP requests to a specific API base URL.
class MyApiClient {
  final String baseUrl;
  final http.Client httpClient;
  MyApiClient({
    required this.baseUrl,
    http.Client? httpClient,
  }) : this.httpClient = httpClient ?? http.Client();

  /// Fetches data from the API for the specified endpoint.
  ///
  /// The [endpoint] should be a string that represents the endpoint of the API to fetch data from.
  Future<http.Response> fetchData(String endpoint) async {
    final url = '$baseUrl/$endpoint';
    final response = await http.get(Uri.parse(url));
    return response;
  }
}

/// A model that represents the data returned by the API.
class MyDataModel {
  final Map<String, dynamic> data;

  MyDataModel({required this.data});

  /// Creates a new instance of [MyDataModel] from the given [json] data.
  ///
  /// The [json] should be a Map that represents the data returned by the API in JSON format.
  factory MyDataModel.fromJson(Map<String, dynamic> json) {
    return MyDataModel(data: json);
  }
}

/// A utility class for parsing the data returned by the API.
class MyDataParser {
  /// Parses the data returned by the API into a [MyDataModel] instance.
  ///
  /// The [response] should be an instance of [http.Response] that contains the response data from the API.
  static MyDataModel parseData(http.Response response) {
    final json = jsonDecode(response.body);
    return MyDataModel.fromJson(json);
  }
}

/// A service that uses the [MyApiClient] to fetch data from the API and returns a [MyDataModel].
class MyApiService {
  final MyApiClient _client;

  MyApiService({required MyApiClient client}) : _client = client;

  /// Fetches data from the API for the specified endpoint and returns a [MyDataModel].
  ///
  /// The [endpoint] should be a string that represents the endpoint of the API to fetch data from.
  Future<MyDataModel> getData(String endpoint) async {
    final response = await _client.fetchData(endpoint);
    return MyDataParser.parseData(response);
  }
}
