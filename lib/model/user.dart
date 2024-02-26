part 'address.dart';
part 'company.dart';
part 'geo.dart';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? phone;
  final String? website;
  final Address? address;
  final Company? company;

  var todos;

  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.website,
    this.address,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Extracting todos from JSON

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}
