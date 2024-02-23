part 'address.dart';
part 'company.dart';
part 'geo.dart';
part 'todos.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String website;
  final Address address;
  final Company company;
  final List<Todo> todos;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
    required this.todos,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Extracting todos from JSON
    List<dynamic> todosJson = json['todos'];
    List<Todo> todos =
        todosJson.map<Todo>((todo) => Todo.fromJson(todo)).toList();

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
      todos: todos,
    );
  }
}
