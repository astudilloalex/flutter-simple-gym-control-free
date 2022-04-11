import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({Key? key, required this.customer}) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.find<AppController>();
    final ResponsiveType type = ResponsiveUtil(
      changePoints: ResponsiveSettings.instance.screenChangePoints,
      context: context,
    ).responsiveType;
    return ListTile(
      onTap: () {
        if (type == ResponsiveType.phone || type == ResponsiveType.watch) {
          Get.toNamed(
            RouteNames.customerDetail,
            parameters: {'id': '${customer.id}'},
          );
        }
      },
      subtitle: Text(controller.dateFormat.format(customer.endDate)),
      title: Text(
        '${customer.firstName} ${customer.lastName}',
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
