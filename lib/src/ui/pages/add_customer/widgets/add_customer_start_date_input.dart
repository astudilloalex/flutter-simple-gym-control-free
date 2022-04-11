import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';
import 'package:simple_gym_control_free/src/ui/utilities/date_picker.dart';

class AddCustomerStartDateInput extends StatelessWidget {
  const AddCustomerStartDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.startDateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'startDate'.tr,
      ),
      onTap: () => showCustomDatePicker(
        context,
      ).then((value) => controller.updateStartDate(value)),
      validator: controller.validateStartDate,
    );
  }
}
