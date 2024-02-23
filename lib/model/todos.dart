part of 'user.dart';

class Todo {
  final String title;
  final String finished;

  Todo({
    required this.title,
    required this.finished,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      finished: json['finished'],
    );
  }
}
