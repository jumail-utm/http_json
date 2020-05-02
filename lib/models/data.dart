import 'assessment.dart';

List<Assessment> assessments = [
  Assessment(
    member: GroupMember(shortName: 'Abdullah', fullName: 'Abdullah Tajuddin'),
    points: [4, 2, 3, 2, 4],
  ),
  Assessment(
    member: GroupMember(
        shortName: 'Aisyah', fullName: 'Siti Nur Aisyah Binti Ahmad Kamal'),
    points: [3, 3, 3, 3, 3],
  ),
  Assessment(
    member:
        GroupMember(shortName: 'Jailani', fullName: 'Ahmad Jailani Bin Saad'),
    points: [2, 1, 3, 2, 1],
  ),
  Assessment(
    member: GroupMember(shortName: 'Amalina', fullName: 'Amalina Dasuki'),
    points: [4, 4, 4, 4, 4],
  ),
];

GroupMember evaluator = assessments[0].member;
