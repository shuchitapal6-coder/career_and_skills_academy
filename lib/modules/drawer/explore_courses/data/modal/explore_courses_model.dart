class TaskModel {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String startDateTime;
  final String endDateTime;
  final String dueDate;
  final String priority;
  final String status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.startDateTime,
    required this.endDateTime,
    required this.dueDate,
    required this.priority,
    required this.status,
  });
}