import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/todos.dart';

class UserTodoScreen extends StatefulWidget {
  const UserTodoScreen({Key? key, required List todos});

  @override
  _UserTodoScreenState createState() => _UserTodoScreenState();
}

class _UserTodoScreenState extends State<UserTodoScreen> {
  late Future<List<Todo>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _todosFuture = fetchTodos();
  }

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3002/todo'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['todos'];
      List<Todo> todos = data.map((item) => Todo.fromJson(item)).toList();
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User ToDos'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Todo> todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(todos[index].title),
                  value: todos[index].finished,
                  onChanged: (bool? value) {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
