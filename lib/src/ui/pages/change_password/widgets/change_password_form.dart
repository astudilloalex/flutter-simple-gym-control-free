import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/change_password_controller.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller =
        Get.find<ChangePasswordController>();
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.currentPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'currentPassword'.tr,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: controller.newPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'newPassword'.tr,
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: controller.repeatPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'confirmNewPassword'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
