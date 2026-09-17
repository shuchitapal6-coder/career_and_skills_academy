class ProfileModel {
  final String name;
  final String email;
  final String role;
  final String avatarUrl;

  final int enrolledCourses;
  final int studyHours;
  final int streakDays;
  final int rank;

  final double overallProgress;

  ProfileModel({
    required this.name,
    required this.email,
    required this.role,
    required this.avatarUrl,
    required this.enrolledCourses,
    required this.studyHours,
    required this.streakDays,
    required this.rank,
    required this.overallProgress,
  });
}