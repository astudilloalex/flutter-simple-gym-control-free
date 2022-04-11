import 'package:simple_gym_control_free/src/domain/entities/employee.dart';
import 'package:simple_gym_control_free/src/domain/entities/role.dart';

class User {
  const User({
    this.id = 0,
    required this.username,
    required this.password,
    required this.employee,
    required this.role,
  });

  final int id;
  final String username;
  final String password;
  final Employee employee;
  final Role role;

  User copyWith({
    final int? id,
    final String? username,
    final String? password,
    final Employee? employee,
    final Role? role,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      employee: employee ?? this.employee,
      role: role ?? this.role,
    );
  }

  factory User.fromJson(final Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      employee: Employee.fromJson(json['employee'] as Map<String, dynamic>),
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != 0) 'id': id,
      'username': username,
      'password': password,
      'employee_id': employee.id,
      'role_id': role.id,
    };
  }
}
