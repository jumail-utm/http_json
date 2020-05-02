import 'package:flutter/material.dart';

import 'constants.dart';
import 'models/data.dart' as data;
import 'screens/details.dart';
import 'screens/summary.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
    case summaryRoute:
      return MaterialPageRoute(
        builder: (context) => SummaryScreen(
            evaluator: data.evaluator, assessments: data.assessments),
      );

    case detailsRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(assessment: settings.arguments),
      );
  }
  return null;
}
