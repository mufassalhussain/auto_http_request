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

  /// Sends an HTTP request to the specified endpoint with the given [method] and [body].
  ///
  /// The [endpoint] should be a string that represents the endpoint of the API to send the request to.
  /// The [method] should be a string that represents the HTTP method to use (e.g. GET, POST, PUT, DELETE).
  /// The [body] should be a Map that represents the request body.
  /// The [headers] should be a Map that represents the request body.
  Future<http.Response> sendRequest(
    String endpoint,
    String method, {
    Map<String, dynamic>? body,
    Map<String, String>? headers, // add headers parameter
  }) async {
    final url = '$baseUrl/$endpoint';
    late http.Response response;
    switch (method) {
      case 'GET':
        response = await http.get(Uri.parse(url), headers: headers);
        break;
      case 'POST':
        response =
            await http.post(Uri.parse(url), headers: headers, body: body);
        break;
      case 'PUT':
        response = await http.put(Uri.parse(url), headers: headers, body: body);
        break;
      case 'DELETE':
        response = await http.delete(Uri.parse(url), headers: headers);
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }
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

/// A service that uses the [MyApiClient] to send HTTP requests to the API and returns a [MyDataModel].
class MyApiService {
  final MyApiClient _client;

  MyApiService({required MyApiClient client}) : _client = client;

  /// Sends an HTTP request to the specified endpoint with the given [method] and [body],
  /// and returns a [MyDataModel] representing the response data from the API.
  ///
  /// The [endpoint] should be a string that represents the endpoint of the API to send the request to.
  /// The [method] should be a string that represents the HTTP method to use (e.g. GET, POST, PUT, DELETE).
  /// The [body] should be a Map that represents the request body.
  /// The [headers] should be a Map that represents the request body.
  Future<MyDataModel> sendRequestAndGetResponse(String endpoint, String method,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final response = await _client.sendRequest(endpoint, method,
        body: body, headers: headers);
    return MyDataParser.parseData(response);
  }
}
