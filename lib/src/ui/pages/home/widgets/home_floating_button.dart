import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add_outlined),
      onPressed: () => Get.toNamed(RouteNames.addCustomer),
    );
  }
}
