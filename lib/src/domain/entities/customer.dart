class Customer {
  const Customer({
    this.id = 0,
    required this.endDate,
    required this.firstName,
    this.email,
    this.phone,
    required this.idCard,
    required this.initialDate,
    required this.lastName,
    required this.startDate,
  });

  final int id;
  final String idCard;
  final String firstName;
  final String lastName;
  final String? email;
  final String? phone;
  final DateTime initialDate;
  final DateTime startDate;
  final DateTime endDate;

  Customer copyWith({
    final int? id,
    final String? idCard,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phone,
    final DateTime? initialDate,
    final DateTime? startDate,
    final DateTime? endDate,
  }) {
    return Customer(
      id: id ?? this.id,
      email: email ?? this.email,
      endDate: endDate ?? this.endDate,
      firstName: firstName ?? this.firstName,
      idCard: idCard ?? this.idCard,
      initialDate: initialDate ?? this.initialDate,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      startDate: startDate ?? this.startDate,
    );
  }

  factory Customer.fromJson(final Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      email: json['email'] as String?,
      endDate: DateTime.parse(json['end_date'].toString()),
      firstName: json['first_name'] as String,
      idCard: json['id_card'] as String,
      initialDate: DateTime.parse(json['initial_date'].toString()),
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      startDate: DateTime.parse(json['start_date'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != 0) 'id': id,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      'end_date': endDate.toString(),
      'first_name': firstName,
      'id_card': idCard,
      'initial_date': initialDate.toString(),
      'last_name': lastName,
      'start_date': startDate.toString(),
    };
  }
}
