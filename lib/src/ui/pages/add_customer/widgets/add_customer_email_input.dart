import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';

class AddCustomerEmailInput extends StatelessWidget {
  const AddCustomerEmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'email'.tr,
      ),
      validator: controller.validateEmail,
    );
  }
}
