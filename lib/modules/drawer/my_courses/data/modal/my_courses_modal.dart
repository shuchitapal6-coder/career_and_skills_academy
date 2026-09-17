class PerformanceModel {
  final String testName;
  final String subject;
  final String date;
  final int attempts;
  final double score;
  final double marks;
  final double totalMarks;

  const PerformanceModel({
    required this.testName,
    required this.subject,
    required this.date,
    required this.attempts,
    required this.score,
    required this.marks,
    required this.totalMarks,
  });

  double get percentage {
    if (totalMarks == 0) return 0;
    return (marks / totalMarks) * 100;
  }
}