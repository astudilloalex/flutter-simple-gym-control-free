class Company {
  const Company({
    this.id = 0,
    required this.name,
    required this.address,
    required this.phone,
  });

  final int id;
  final String name;
  final String phone;
  final String address;
}
