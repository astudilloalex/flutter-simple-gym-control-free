import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_gym_control_free/src/domain/repositories/local/secure_storage_repository.dart';

class SecureStorage implements SecureStorageRepository {
  const SecureStorage();

  @override
  Future<Map<String, String>?> get credentials async {
    final String? username = await _secureStorage.read(key: 'username');
    final String? password = await _secureStorage.read(key: 'password');
    if (username == null || password == null) return null;
    return {
      'username': username,
      'password': password,
    };
  }

  @override
  Future<void> saveCredentials(String username, String password) async {
    await _secureStorage.write(key: 'username', value: username);
    return _secureStorage.write(key: 'password', value: password);
  }

  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage();
}
