# Auto HTTP Request

Auto HTTP Request is a Dart package for making HTTP requests to a specific API base URL and parsing responses into a generic data model.

## Installation
Add the following to your `pubspec.yaml` file:
```
dependencies:
  auto_http_request: ^0.0.1
```

## Usage
To use Auto HTTP Request in your Dart code, import the package:
```
import 'package:auto_http_request/auto_http_request.dart';
```

## Making API Requests
To make an API request, first create an instance of `MyApiClient` with the base URL of your API:
```
final client = MyApiClient(baseUrl: 'https://my-api.com');
```
Then use the `fetchData` method to fetch data from a specific endpoint:
```
final response = await client.fetchData('/users');
```
This will return an instance of http.Response that you can use to access the response data.

## Parsing API Responses
To parse the response data into a generic data model, use `MyDataParser`:
```
final myData = MyDataParser.parseData(response);
```
This will return an instance of `MyDataModel` that represents the data returned by the API.

## Service Layer
To simplify your code, you can create a service layer that encapsulates the API requests and response parsing:
```
final service = MyApiService(client: client);
final myData = await service.getData('/users');
```
This will return an instance of  `MyDataModel` that represents the data returned by the API.

## Example
Here is an example of how to use Auto HTTP Request to fetch data from an API:
```
import 'package:auto_http_request/auto_http_request.dart';

void main() async {
  final client = MyApiClient(baseUrl: 'https://my-api.com');
  final service = MyApiService(client: client);
  
  try {
    final myData = await service.getData('/users');
    print(myData.data); // prints the response data
  } catch (e) {
    print(e); // prints the error message
  }
}
```

## Contributing
If you would like to contribute to Auto HTTP Request, please open an issue or pull request on GitHub.



## MIT License
```
Copyright (c) 2023 Mufassal Hussain

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
