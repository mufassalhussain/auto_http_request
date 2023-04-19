import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_http_request/auto_http_request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _apiService = MyApiService(
    client: MyApiClient(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Center(
          child: FutureBuilder(
            future: _apiService.getData('posts/1'),
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (snapshot.hasData) {
                final response = snapshot.data as MyDataModel;
                return Text(response.data['title'].toString());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}