import '../constants/tasktype.dart';

class Task {
  String title;
  String description;
  TaskType type;
  bool isCompleted;

  Task(
      {required this.title,
      required this.description,
      required this.type,
      this.isCompleted = false});
}
