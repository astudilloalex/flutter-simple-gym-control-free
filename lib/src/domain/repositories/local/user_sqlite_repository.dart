import 'package:simple_gym_control_free/src/domain/entities/user.dart';

abstract class UserSQLiteRepository {
  const UserSQLiteRepository();

  Future<User?> findById(final int id);
  Future<User?> findByUsername(final String username);
  Future<User?> updateUser(final User user);
}
