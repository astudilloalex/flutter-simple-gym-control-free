import 'package:flutter/material.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile(this.customer, {Key? key}) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.firstName),
    );
  }
}
