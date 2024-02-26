import 'package:flutter/material.dart';
import 'package:restapi/model/user.dart';
import 'package:restapi/pages/user_todos.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('ID: ${user.id}'),
            const SizedBox(height: 8),
            Text('Name: ${user.name}'),
            // ... (other details)
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserTodoScreen(
                        todos: user.todos, // Pass the actual list of todos
                      ),
                    ),
                  );
                },
                child: const Text('Show ToDos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
