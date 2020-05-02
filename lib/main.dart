import 'package:flutter/material.dart';

import 'constants.dart';
import 'router.dart';

void main() => runApp(
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
