import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';

class AddCustomerIdCardInput extends StatelessWidget {
  const AddCustomerIdCardInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.idCardController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'idCard'.tr,
      ),
      validator: controller.validateIdCard,
    );
  }
}
