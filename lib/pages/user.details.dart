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
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
            const SizedBox(height: 8),
            Text('Username: ${user.username}'),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}'),
            const SizedBox(height: 8),
            Text('Website: ${user.website}'),
            const SizedBox(height: 8),
            Text(
                'Address: ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
            const SizedBox(height: 8),
            Text('Geo: ${user.address.geo.lat}, ${user.address.geo.lng}'),
            const SizedBox(height: 8),
            Text(
                'Company: ${user.company.name}, ${user.company.catchPhrase}, ${user.company.bs}'),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Ensure user.todos is not null before navigating to UserTodoScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserTodoScreen(todos: user.todos),
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
