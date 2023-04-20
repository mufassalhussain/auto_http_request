# Auto HTTP Request

The `auto_http_request` library is a Dart package that provides a simple client for making HTTP requests to a specific API base URL. The library also includes a utility class for parsing the response data from the API.

## Installation
Add the following to your `pubspec.yaml` file:
```
dependencies:
  auto_http_request: ^0.0.4
```

## Usage
To use Auto HTTP Request in your Dart code, import the package:
```
import 'package:auto_http_request/auto_http_request.dart';
```

## Making API Requests
To make an API request, first create an instance of `MyApiClient` with the base URL of your API:
```
final client = MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com');
final service = MyApiService(client: client);

// GET request
final responseGet = await service.sendRequestAndGetResponse('todos/1', 'GET',headers:{});
final dataGet = responseGet.data;
print(dataGet); // prints: {userId: 1, id: 1, title: delectus aut autem, completed: false}

// POST request
final responsePost =
    await service.sendRequestAndGetResponse('posts', 'POST', body: {
  'title': 'foo',
  'body': 'bar',
  'userId': 1,
});
final dataPost = responsePost.data;
print(dataPost); // prints: {id: 101, title: foo, body: bar, userId: 1}

// PUT request
final responsePut =
    await service.sendRequestAndGetResponse('posts/1', 'PUT', body: {
  'title': 'foo updated',
  'body': 'bar updated',
  'userId': 1,
});
final dataPut = responsePut.data;
print(dataPut); // prints: {userId: 1, id: 1, title: foo updated, body: bar updated}

// DELETE request
final responseDelete =
    await service.sendRequestAndGetResponse('posts/1', 'DELETE');
final dataDelete = responseDelete.data;
print(dataDelete); // prints: {}

```

## Headers in Requests
```
final responseGet = await service.sendRequestAndGetResponse('todos/1', 'GET',headers:{});

```
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
  final myData = await service.sendRequestAndGetResponse('/users', 'GET');
```
This will return an instance of  `MyDataModel` that represents the data returned by the API.

## Example
Here is an example of how to use Auto HTTP Request to fetch data from an API:
```
import 'package:auto_http_request/auto_http_request.dart';
getData() async {
  final client = MyApiClient(baseUrl: 'https://my-api.com');
  final service = MyApiService(client: client);

  try {
    final myData = await service.sendRequestAndGetResponse('/users', 'GET');
    print(myData.data);
  } catch (e) {
    print(e);
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
