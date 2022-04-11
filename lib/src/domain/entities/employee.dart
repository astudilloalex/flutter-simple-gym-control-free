class Employee {
  const Employee({
    this.id = 0,
    required this.hireDate,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.idCard,
  });

  final int id;
  final String idCard;
  final DateTime hireDate;
  final String firstName;
  final String lastName;
  final String email;

  factory Employee.fromJson(final Map<String, dynamic> json) {
    return Employee(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      hireDate: DateTime.parse(json['hire_date'].toString()),
      id: json['id'] as int,
      lastName: json['last_name'] as String,
      idCard: json['id_card'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != 0) 'id': id,
      'id_card': idCard,
      'hire_date': hireDate,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }
}
