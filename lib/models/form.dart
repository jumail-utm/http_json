class Form {
  int id;
  List<Scale> scales;
  List<Criterion> criteria;

  Form({this.id, this.criteria, this.scales});

  Form.fromJson(Map<String, dynamic> json)
      : this(
            scales: (json['scales'] as List)
                .map((item) => Scale.fromJson(item))
                .toList(),
            criteria: (json['criteria'] as List)
                .map((item) => Criterion.fromJson(item))
                .toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'scales': scales,
        'criteria': criteria,
      };
}

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
