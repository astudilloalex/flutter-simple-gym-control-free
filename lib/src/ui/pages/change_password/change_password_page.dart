import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/responsive/change_password_phone.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveWidget(
        phone: ChangePasswordPhone(),
      ),
    );
  }
}
