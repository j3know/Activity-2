import 'package:flutter/material.dart';
import 'package:restapi/model/user.dart';

class UserTodoScreen extends StatelessWidget {
  final List<Todo> todos;

  const UserTodoScreen({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User ToDos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          // Convert string "true" or "false" to boolean value
          // ignore: unnecessary_type_check
          bool finished = todos[index].finished is String
              ? todos[index].finished.toLowerCase() == 'true'
              : todos[index].finished as bool;

          return CheckboxListTile(
            controlAffinity:
                ListTileControlAffinity.leading, // Placing checkbox on the left
            title: Text(todos[index].title),
            value: finished,
            onChanged:
                (bool? value) {}, // Use the finished value from the todo item
          );
        },
      ),
    );
  }
}
