import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';

class AddCustomerFirstNameInput extends StatelessWidget {
  const AddCustomerFirstNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.firstNameController,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'firstName'.tr,
      ),
      validator: controller.validateFirstName,
    );
  }
}
