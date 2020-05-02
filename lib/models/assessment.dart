class GroupMember {
  String shortName;
  String fullName;

  GroupMember({this.shortName, this.fullName});

  GroupMember.copy(GroupMember from)
      : this(shortName: from.shortName, fullName: from.fullName);
}

class Assessment {
  GroupMember member;
  List<int> points;

  Assessment({this.member, this.points});
  Assessment.copy(Assessment from)
      : this(member: GroupMember.copy(from.member), points: [...from.points]);

  double get percent =>
      (points.reduce((sum, item) => sum + item) / 20.0) * 100.0;
}
