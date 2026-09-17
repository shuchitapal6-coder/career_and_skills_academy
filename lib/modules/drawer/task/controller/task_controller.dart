import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/modal/task_model.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/modal/task_model.dart';

class TaskController extends GetxController {
  final isLoading = false.obs;

  final selectedFilter = 'All'.obs;

  final filters = [
    'All',
    'Pending',
    'In Progress',
    'Completed',
  ];

  // ============================================================
  // TASK LIST
  // ============================================================

  final tasks = <TaskModel>[
    TaskModel(
      id: '1',
      title: 'Complete Flutter Assignment',
      description:
      'Complete the Flutter UI assignment and submit it before the deadline.',
      subject: 'Flutter Development',
      startDateTime: '2026-09-18T10:00:00',
      endDateTime: '2026-09-20T18:00:00',
      dueDate: '20 Sep 2026',
      priority: 'High',
      status: 'Pending',
    ),
    TaskModel(
      id: '2',
      title: 'Dart DSA Practice',
      description:
      'Practice arrays, strings and linked list problems in Dart.',
      subject: 'Dart',
      startDateTime: '2026-09-19T09:00:00',
      endDateTime: '2026-09-21T17:00:00',
      dueDate: '21 Sep 2026',
      priority: 'Medium',
      status: 'In Progress',
    ),
    TaskModel(
      id: '3',
      title: 'Database Assignment',
      description: 'Complete SQLite database exercises.',
      subject: 'Database',
      startDateTime: '2026-09-17T10:00:00',
      endDateTime: '2026-09-18T18:00:00',
      dueDate: '18 Sep 2026',
      priority: 'Low',
      status: 'Completed',
    ),
  ].obs;

  // ============================================================
  // ADD / UPDATE
  // ============================================================

  String? editingTaskId;

  final TextEditingController taskDetailsController =
  TextEditingController();

  final TextEditingController taskTitleController =
  TextEditingController();

  final RxString selectedTaskType = 'Instruction'.obs;

  final Rxn<DateTime> startDateTime = Rxn<DateTime>();
  final Rxn<DateTime> endDateTime = Rxn<DateTime>();

  // ============================================================
  // FILTERED TASKS
  // ============================================================

  List<TaskModel> get filteredTasks {
    if (selectedFilter.value == 'All') {
      return tasks.toList();
    }

    return tasks
        .where(
          (task) => task.status == selectedFilter.value,
    )
        .toList();
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  // ============================================================
  // TASK TYPE
  // ============================================================

  void changeTaskType(String type) {
    selectedTaskType.value = type;
  }

  // ============================================================
  // MARK COMPLETE
  // ============================================================

  void markComplete(TaskModel task) {
    final index = tasks.indexWhere(
          (element) => element.id == task.id,
    );

    if (index == -1) return;

    tasks[index] = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      subject: task.subject,
      startDateTime: task.startDateTime,
      endDateTime: task.endDateTime,
      dueDate: task.dueDate,
      priority: task.priority,
      status: 'Completed',
    );

    tasks.refresh();

    Get.snackbar(
      'Task Completed',
      'Task marked as completed',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // ============================================================
  // START DATE & TIME
  // ============================================================

  Future<void> selectStartDateTime(
      BuildContext context,
      ) async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: startDateTime.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: startDateTime.value != null
          ? TimeOfDay.fromDateTime(startDateTime.value!)
          : TimeOfDay.now(),
    );

    if (time == null) return;

    final selected = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    startDateTime.value = selected;

    if (endDateTime.value != null &&
        endDateTime.value!.isBefore(selected)) {
      endDateTime.value = null;
    }
  }

  // ============================================================
  // END DATE & TIME
  // ============================================================

  Future<void> selectEndDateTime(
      BuildContext context,
      ) async {
    final now = DateTime.now();

    final minimumDate = startDateTime.value ?? now;

    final date = await showDatePicker(
      context: context,
      initialDate: endDateTime.value ?? minimumDate,
      firstDate: minimumDate,
      lastDate: DateTime(now.year + 5),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: endDateTime.value != null
          ? TimeOfDay.fromDateTime(endDateTime.value!)
          : TimeOfDay.now(),
    );

    if (time == null) return;

    final selected = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    if (startDateTime.value != null &&
        selected.isBefore(startDateTime.value!)) {
      Get.snackbar(
        'Invalid Time',
        'End date & time must be after start date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    endDateTime.value = selected;
  }

  // ============================================================
  // FORMAT DATE
  // ============================================================

  String formatDateTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0
        ? 12
        : dateTime.hour % 12;

    final minute =
    dateTime.minute.toString().padLeft(2, '0');

    final period =
    dateTime.hour >= 12 ? 'PM' : 'AM';

    return '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year}  '
        '$hour:$minute $period';
  }

  // ============================================================
  // START EDIT
  // ============================================================

  void startEditTask(TaskModel task) {
    editingTaskId = task.id;

    taskTitleController.text = task.title;
    taskDetailsController.text = task.description;

    selectedTaskType.value = task.subject;

    startDateTime.value =
        DateTime.tryParse(task.startDateTime);

    endDateTime.value =
        DateTime.tryParse(task.endDateTime);
  }

  // ============================================================
  // CREATE TASK
  // ============================================================

  bool createTask() {
    final details =
    taskDetailsController.text.trim();

    if (details.isEmpty) {
      Get.snackbar(
        'Required',
        'Please enter task details.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (startDateTime.value == null) {
      Get.snackbar(
        'Required',
        'Please select start date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (endDateTime.value == null) {
      Get.snackbar(
        'Required',
        'Please select end date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (endDateTime.value!.isBefore(
      startDateTime.value!,
    )) {
      Get.snackbar(
        'Invalid Time',
        'End date & time must be after start date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    addTask(
      type: selectedTaskType.value,
      details: details,
      startDateTime: startDateTime.value!,
      endDateTime: endDateTime.value!,
    );

    resetAddTaskFields();

    Get.snackbar(
      'Success',
      'Task created successfully.',
      snackPosition: SnackPosition.BOTTOM,
    );

    return true;
  }

  // ============================================================
  // ADD TASK
  // ============================================================

  void addTask({
    required String type,
    required String details,
    required DateTime startDateTime,
    required DateTime endDateTime,
  }) {
    final newTask = TaskModel(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      title: details,
      description: details,
      subject: type,
      startDateTime: startDateTime.toIso8601String(),
      endDateTime: endDateTime.toIso8601String(),
      dueDate: formatDateTime(endDateTime),
      priority: 'Medium',
      status: 'Pending',
    );

    tasks.insert(0, newTask);

    selectedFilter.value = 'All';
  }

  // ============================================================
  // UPDATE TASK
  // ============================================================

  bool updateTask() {
    if (editingTaskId == null) {
      Get.snackbar(
        'Error',
        'Task not found.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    final details =
    taskDetailsController.text.trim();

    if (details.isEmpty) {
      Get.snackbar(
        'Required',
        'Please enter task details.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (startDateTime.value == null) {
      Get.snackbar(
        'Required',
        'Please select start date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (endDateTime.value == null) {
      Get.snackbar(
        'Required',
        'Please select end date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (endDateTime.value!.isBefore(
      startDateTime.value!,
    )) {
      Get.snackbar(
        'Invalid Time',
        'End date & time must be after start date & time.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    final index = tasks.indexWhere(
          (task) => task.id == editingTaskId,
    );

    if (index == -1) {
      Get.snackbar(
        'Error',
        'Task not found.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    final oldTask = tasks[index];

    tasks[index] = TaskModel(
      id: oldTask.id,

      // Update title also with details.
      title: details,

      description: details,

      subject: selectedTaskType.value,

      startDateTime:
      startDateTime.value!.toIso8601String(),

      endDateTime:
      endDateTime.value!.toIso8601String(),

      dueDate:
      formatDateTime(endDateTime.value!),

      priority: oldTask.priority,

      // Preserve existing status.
      status: oldTask.status,
    );

    tasks.refresh();

    resetAddTaskFields();

    Get.snackbar(
      'Task Updated',
      'Task has been updated successfully.',
      snackPosition: SnackPosition.BOTTOM,
    );

    return true;
  }

  // ============================================================
  // RESET
  // ============================================================

  void resetAddTaskFields() {
    taskTitleController.clear();
    taskDetailsController.clear();

    selectedTaskType.value = 'Instruction';

    startDateTime.value = null;
    endDateTime.value = null;

    editingTaskId = null;
  }

  bool deleteTask(TaskModel task) {
    final index = tasks.indexWhere(
          (element) => element.id == task.id,
    );

    if (index == -1) {
      return false;
    }

    tasks.removeAt(index);

    return true;
  }
  @override
  void onClose() {
    taskTitleController.dispose();
    taskDetailsController.dispose();

    super.onClose();
  }
}