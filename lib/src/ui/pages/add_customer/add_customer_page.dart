import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/responsive/add_customer_phone.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: AddCustomerPhone(),
    );
  }
}
