// Fetching JSON data from the internet using the http package.
// For convinience, in this demo all data (i.e. assessements, criteria and scales) are consilidated in a single JSON data, so that we fetch only once
// The fetching process is done in the main() program
// Fetched data are stored in global variables. It is not a recommended to use global. However, we use here only for demonstration purpose.

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'assessment.dart';
import 'form.dart';

// Global variables to store the fetched data from the interenet
GroupMember evaluator;
List<Assessment> assessments;
List<Scale> scales;
List<Criterion> criteria;

// fetchData() - To fetch data from the internet using the http package
//               The fetched data are stored in global variables (Not recommended approach. This is only for demonstration purpose)

Future<void> fetchData(String url) async {
  print('Fetching data from $url');

  http.Response response = await http.get(url);

  print('Fetching has completed with status code ${response.statusCode}');

  String stringJson = response.body;
  Map<String, dynamic> _json = json.decode(stringJson);

  evaluator = GroupMember.fromJson(_json['evaluator']);
  assessments = (_json['assessments'] as List)
      .map((item) => Assessment.fromJson(item))
      .toList();

  scales =
      (_json['scales'] as List).map((item) => Scale.fromJson(item)).toList();

  criteria = (_json['criteria'] as List)
      .map((item) => Criterion.fromJson(item))
      .toList();
}
