class Criterion {
  String title;
  String description;

  Criterion({this.title, this.description});
  Criterion.fromJson(Map<String, dynamic> json)
      : this(title: json['title'], description: json['description']);

  Map<String, dynamic> toJson() => {'title': title, 'description': description};
}

class Scale {
  int value;
  String title;

  Scale({this.value, this.title});
  Scale.fromJson(Map<String, dynamic> json)
      : this(value: json['value'], title: json['title']);

  Map<String, dynamic> toJson() => {'value': value, 'title': title};
}

// Hard-coded parsed JSON, for testing purposes

Map<String, dynamic> _json = {
  "scales": [
    {"title": "Excellent", "value": 4},
    {"title": "Good", "value": 3},
    {"title": "Fair", "value": 2},
    {"title": "Poor", "value": 1},
    {"title": "Not at all", "value": 0}
  ],
  "criteria": [
    {
      "title": "Interaction",
      "description": "Degree of interaction with other members"
    },
    {
      "title": "Commitment",
      "description": "Degree of participation to the project execution"
    },
    {
      "title": "Effort",
      "description":
          "The amount of effort and work contributed to the project outcome"
    },
    {"title": "Adaptability", "description": "Ease of adapting to the group"},
    {
      "title": "Personality",
      "description": "Degree of compromisation between group members"
    }
  ]
};

// Testing the fromJson() method

List<Scale> scales =
    (_json['scales'] as List).map((item) => Scale.fromJson(item)).toList();

List<Criterion> criteria = (_json['criteria'] as List)
    .map((item) => Criterion.fromJson(item))
    .toList();
