import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';
import 'package:simple_gym_control_free/src/ui/utilities/date_picker.dart';

class AddCustomerInitDateInput extends StatelessWidget {
  const AddCustomerInitDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return TextFormField(
      controller: controller.initialDateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'initialDate'.tr,
      ),
      onTap: () => showCustomDatePicker(
        context,
      ).then((value) => controller.updateInitialDate(value)),
    );
  }
}
