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
