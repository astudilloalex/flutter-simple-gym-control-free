import 'package:simple_gym_control_free/src/data/local/sqlite/sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';
import 'package:simple_gym_control_free/src/domain/repositories/local/user_sqlite_repository.dart';
import 'package:sqflite/sqflite.dart';

class UserSQLite implements UserSQLiteRepository {
  const UserSQLite();

  @override
  Future<User?> findById(final int id) async {
    final Database database = await SQLite.instance.database;
    final Map<String, dynamic> data = {};
    final List<Map<String, Object?>> users = await database.query(
      'users',
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );
    if (users.isEmpty) return null;
    data.addAll(users.first);
    database.query(
      'roles',
      where: 'id=?',
      whereArgs: [data['role_id']],
    ).then((value) => data['role'] = value.first);
    await database.query(
      'employees',
      where: 'id=?',
      whereArgs: [data['employee_id']],
    ).then((value) => data['employee'] = value.first);
    return User.fromJson(data);
  }

  @override
  Future<User?> findByUsername(final String username) async {
    final Database database = await SQLite.instance.database;
    final Map<String, dynamic> data = {};
    final List<Map<String, Object?>> users = await database.query(
      'users',
      where: 'username=?',
      whereArgs: [username],
      limit: 1,
    );
    if (users.isEmpty) return null;
    data.addAll(users.first);
    database.query(
      'roles',
      where: 'id=?',
      whereArgs: [data['role_id']],
    ).then((value) => data['role'] = value.first);
    await database.query(
      'employees',
      where: 'id=?',
      whereArgs: [data['employee_id']],
    ).then((value) => data['employee'] = value.first);
    return User.fromJson(data);
  }

  @override
  Future<User?> updateUser(final User user) async {
    final Database database = await SQLite.instance.database;
    final int count = await database.update(
      'users',
      user.toJson(),
      where: 'id=?',
      whereArgs: [user.id],
    );
    if (count == 1) return findById(user.id);
    return null;
  }
}
