import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';

class AddCustomerButton extends StatelessWidget {
  const AddCustomerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return ElevatedButton.icon(
      onPressed: controller.save,
      icon: const Icon(Icons.save_outlined),
      label: Text('save'.tr),
    );
  }
}
