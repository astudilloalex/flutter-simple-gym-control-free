class Role {
  const Role({
    this.id = 0,
    required this.code,
    required this.name,
  });

  final int id;
  final String code;
  final String name;

  factory Role.fromJson(final Map<String, dynamic> json) {
    return Role(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != 0) 'id': id,
      'code': code,
      'name': name,
    };
  }
}
