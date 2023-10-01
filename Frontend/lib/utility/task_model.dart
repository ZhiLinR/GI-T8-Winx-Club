import 'dart:convert';

List<Task> tasksFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String tasksToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  String taskName;
  String taskDescription;

  Task({
    required this.taskName,
    required this.taskDescription,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskName: json["task_name"],
        taskDescription: json["task_description"],
      );

  Map<String, dynamic> toJson() => {
        "task_name": taskName,
        "task_description": taskDescription,
      };
}
