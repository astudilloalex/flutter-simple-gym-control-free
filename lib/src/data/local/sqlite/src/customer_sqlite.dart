import 'package:simple_gym_control_free/src/data/local/sqlite/sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/domain/repositories/local/customer_sqlite_repository.dart';
import 'package:sqflite/sqflite.dart';

class CustomerSQLite implements CustomerSQLiteRepository {
  const CustomerSQLite();

  @override
  Future<List<Customer>> findAll() async {
    final Database database = await SQLite.instance.database;
    final List<Map<String, Object?>> data = await database.query('customers');
    return data.map((json) => Customer.fromJson(json)).toList();
  }

  @override
  Future<Customer?> findById(final int id) async {
    final Database database = await SQLite.instance.database;
    final List<Map<String, Object?>> data = await database.query(
      'customers',
      where: 'id=?',
      whereArgs: [id],
    );
    if (data.isEmpty) return null;
    return Customer.fromJson(data.first);
  }

  @override
  Future<List<Customer>> findPaginated([
    final Customer? lastCustomer,
    final int size = 25,
  ]) async {
    final Database database = await SQLite.instance.database;
    final List<Map<String, Object?>> customers = lastCustomer != null
        ? await database.query(
            'customers',
            orderBy: 'id',
            where: 'id>?',
            whereArgs: [lastCustomer.id],
            limit: size,
          )
        : await database.query(
            'customers',
            orderBy: 'id',
            limit: size,
          );
    return customers.map((json) => Customer.fromJson(json)).toList();
  }

  @override
  Future<Customer?> save(final Customer customer) async {
    final Database database = await SQLite.instance.database;
    return findById(await database.insert('customers', customer.toJson()));
  }

  @override
  Future<List<Customer>> searchService(final String value) async {
    final Database database = await SQLite.instance.database;
    final bool number = RegExp(r'\d').hasMatch(value);
    final List<Map<String, Object?>> customers = number
        ? await database.query(
            'customers',
            where: 'id_card LIKE ?',
            whereArgs: ['%$value%'],
          )
        : await database.query(
            'customers',
            where: "first_name || ' ' || last_name LIKE ?",
            whereArgs: ['%$value%'],
          );
    return customers.map((json) => Customer.fromJson(json)).toList();
  }

  @override
  Future<Customer?> update(final Customer customer) async {
    final Database database = await SQLite.instance.database;
    final int count = await database.update(
      'customers',
      customer.toJson(),
      where: 'id=?',
      whereArgs: [customer.id],
    );
    if (count == 1) return findById(customer.id);
    return null;
  }
}
