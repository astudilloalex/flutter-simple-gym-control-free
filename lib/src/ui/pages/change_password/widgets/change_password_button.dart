import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/change_password_controller.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller =
        Get.find<ChangePasswordController>();
    return ElevatedButton(
      onPressed: controller.changePassword,
      child: Text('updatePassword'.tr),
    );
  }
}
