import 'package:simple_gym_control_free/src/domain/entities/customer.dart';

abstract class CustomerSQLiteRepository {
  const CustomerSQLiteRepository();

  Future<List<Customer>> findAll();
  Future<Customer?> findById(final int id);
  Future<List<Customer>> findPaginated([
    final Customer? lastCustomer,
    final int size = 25,
  ]);
  Future<Customer?> save(final Customer customer);
  Future<List<Customer>> searchService(final String value);
  Future<Customer?> update(final Customer customer);
}
