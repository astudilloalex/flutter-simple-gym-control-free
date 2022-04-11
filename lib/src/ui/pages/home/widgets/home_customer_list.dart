import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class HomeCustomerList extends StatelessWidget {
  const HomeCustomerList({
    Key? key,
    required this.customers,
  }) : super(key: key);

  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final ResponsiveType type = ResponsiveUtil(
      changePoints: ResponsiveSettings.instance.screenChangePoints,
      context: context,
    ).responsiveType;
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
            if (type == ResponsiveType.phone || type == ResponsiveType.watch) {
              Get.toNamed(
                RouteNames.customerDetail,
                parameters: {'id': '${customers[index].id}'},
              );
            }
          },
          subtitle: Text(controller.formattedDate(customers[index].endDate)),
          title: Text(
            '${customers[index].firstName} ${customers[index].lastName}',
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        );
      },
    );
  }
}
