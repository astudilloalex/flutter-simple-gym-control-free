import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/sign_in/sign_in_controller.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.usernameController,
            decoration: InputDecoration(
              labelText: 'username'.tr,
            ),
          ),
          const SizedBox(height: 16.0),
          Obx(() {
            return TextFormField(
              controller: controller.passwordController,
              obscureText: !controller.visiblePassword,
              decoration: InputDecoration(
                labelText: 'password'.tr,
                suffixIcon: IconButton(
                  onPressed: controller.changeVisiblePassword,
                  icon: Icon(
                    controller.visiblePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
