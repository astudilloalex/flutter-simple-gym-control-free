import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/responsive/customer_detail_phone.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: CustomerDetailPhone(),
    );
  }
}
