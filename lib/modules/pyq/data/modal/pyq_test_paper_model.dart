class PyqTestPaperModel {
  final int id;
  final String title;
  final String year;
  final List<String> questionImages;

  const PyqTestPaperModel({
    required this.id,
    required this.title,
    required this.year,
    this.questionImages = const [],
  });
}