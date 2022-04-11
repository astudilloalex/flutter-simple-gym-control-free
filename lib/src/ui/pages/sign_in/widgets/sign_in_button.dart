import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/sign_in/sign_in_controller.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.login_outlined),
      label: Text('signIn'.tr),
      onPressed: Get.find<SignInController>().signIn,
    );
  }
}
