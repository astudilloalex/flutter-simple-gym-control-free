abstract class SecureStorageRepository {
  const SecureStorageRepository();

  Future<void> saveCredentials(final String username, final String password);

  Future<Map<String, String>?> get credentials;
}
