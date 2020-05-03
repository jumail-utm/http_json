import 'package:flutter/material.dart';
import 'package:navigation_simple/router.dart';
import 'constants.dart';
import 'models/data.dart';

void main() async {
  await fetchData('http://www.mocky.io/v2/5ea539bd3000005900ce2e8f');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_http_json',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: homeRoute,
      onGenerateRoute: createRoute,
    ),
  );
}
