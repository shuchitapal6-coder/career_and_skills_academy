class StudySubjectModel {
  final int id;
  final String name;
  final int chapters;
  final int completed;
  final String? image;
  final String? description;

  const StudySubjectModel({
    required this.id,
    required this.name,
    required this.chapters,
    required this.completed,
    this.image,
    this.description,
  });

  /// Progress between 0.0 and 1.0
  double get progress {
    if (chapters <= 0) {
      return 0.0;
    }

    final value = completed / chapters;

    return value.clamp(0.0, 1.0);
  }

  /// Progress percentage
  int get progressPercentage {
    return (progress * 100).round();
  }

  /// Whether the subject has been started
  bool get isStarted {
    return completed > 0;
  }

  /// Whether the subject is completely finished
  bool get isCompleted {
    return chapters > 0 && completed >= chapters;
  }

  /// Remaining chapters
  int get remainingChapters {
    final remaining = chapters - completed;

    return remaining < 0 ? 0 : remaining;
  }

  factory StudySubjectModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return StudySubjectModel(
      id: _parseInt(json['id']),
      name: json['name']?.toString() ?? '',
      chapters: _parseInt(json['chapters']),
      completed: _parseInt(json['completed']),
      image: json['image']?.toString(),
      description: json['description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'chapters': chapters,
      'completed': completed,
      'image': image,
      'description': description,
    };
  }

  StudySubjectModel copyWith({
    int? id,
    String? name,
    int? chapters,
    int? completed,
    String? image,
    String? description,
  }) {
    return StudySubjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      chapters: chapters ?? this.chapters,
      completed: completed ?? this.completed,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is double) {
      return value.toInt();
    }

    return int.tryParse(
      value?.toString() ?? '',
    ) ??
        0;
  }
}