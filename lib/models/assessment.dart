class GroupMember {
  String shortName;
  String fullName;

  GroupMember({this.shortName, this.fullName});

  GroupMember.copy(GroupMember from)
      : this(shortName: from.shortName, fullName: from.fullName);

  GroupMember.fromJson(Map<String, dynamic> json)
      : this(shortName: json['shortName'], fullName: json['fullName']);

  Map<String, dynamic> toJson() =>
      {'shortName': shortName, 'fullName': fullName};
}

class Assessment {
  GroupMember member;
  List<int> points;

  Assessment({this.member, this.points});
  Assessment.copy(Assessment from)
      : this(member: GroupMember.copy(from.member), points: [...from.points]);

  Assessment.fromJson(Map<String, dynamic> json)
      : this(
          member: GroupMember.fromJson(
            json['member'],
          ),
          points: [...json['points']],
        );

  Map<String, dynamic> toJson() => {
        'member': member.toJson(),
        'points': [...points]
      };

  double get percent =>
      (points.reduce((sum, item) => sum + item) / 20.0) * 100.0;
}
