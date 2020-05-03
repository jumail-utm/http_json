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

List<Criterion> criteria = [
  Criterion(
      title: 'Interaction',
      description: 'Degree of interaction with other members'),
  Criterion(
      title: 'Commitment',
      description: 'Degree of participation to the project execution'),
  Criterion(
      title: 'Effort',
      description:
          'The amount of effort and work contributed to the project outcome'),
  Criterion(
      title: 'Adaptability', description: 'Ease of adapting to the group'),
  Criterion(
      title: 'Personality',
      description: 'Degree of compromisation between group members'),
];

List<Scale> scales = [
  Scale(value: 4, title: 'Excellent'),
  Scale(value: 3, title: 'Good'),
  Scale(value: 2, title: 'Fair'),
  Scale(value: 1, title: 'Poor'),
  Scale(value: 0, title: 'Not at all')
];
