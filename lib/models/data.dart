import 'assessment.dart';

// Hard-coded parsed JSON, for testing purposes

Map<String, dynamic> _json = {
  "evaluator": {"shortName": "Abdullah", "fullName": "Abdullah Tajuddin"},
  "assessments": [
    {
      "member": {"shortName": "Abdullah", "fullName": "Abdullah Tajuddin"},
      "points": [4, 2, 3, 2, 4]
    },
    {
      "member": {
        "shortName": "Aisyah",
        "fullName": "Siti Nur Aisyah Binti Ahmad Kamal"
      },
      "points": [3, 3, 3, 3, 3]
    },
    {
      "member": {"shortName": "Jailani", "fullName": "Ahmad Jailani Bin Saad"},
      "points": [2, 1, 3, 2, 1]
    },
    {
      "member": {"shortName": "Amalina", "fullName": "Amalina Dasuki"},
      "points": [4, 4, 4, 4, 4]
    }
  ],
};

// Testing the fromJson() method

GroupMember evaluator = GroupMember.fromJson(_json['evaluator']);
List<Assessment> assessments = (_json['assessments'] as List)
    .map((item) => Assessment.fromJson(item))
    .toList();
