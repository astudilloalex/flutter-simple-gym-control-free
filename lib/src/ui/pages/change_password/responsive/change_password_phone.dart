import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/widgets/change_password_button.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/widgets/change_password_form.dart';

class ChangePasswordPhone extends StatelessWidget {
  const ChangePasswordPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: ListView(
        children: [
          Text(
            'resetPassword'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          const ChangePasswordForm(),
          const SizedBox(height: 16.0),
          const ChangePasswordButton(),
        ],
      ),
    );
  }
}
