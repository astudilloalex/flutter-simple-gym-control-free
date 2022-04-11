import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/widgets/customer_detail_error.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/widgets/customer_detail_info.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';

class CustomerDetailPhone extends StatelessWidget {
  const CustomerDetailPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerDetailController controller =
        Get.find<CustomerDetailController>();
    return Scaffold(
      appBar: AppBar(title: Text('customerDetail'.tr)),
      body: Obx(() {
        if (controller.loading) return const CustomProgressIndicator();
        if (controller.customer == null) return const CustomerDetailError();
        return CustomerDetailInfo(
          customer: controller.customer!,
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.customer == null) return const Center();
        return FloatingActionButton(
          onPressed: () => Get.toNamed(
            RouteNames.addCustomer,
            parameters: {'id': '${controller.customer!.id}'},
          ),
          child: const Icon(Icons.edit_outlined),
        );
      }),
    );
  }
}
