import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/splash/splash_controller.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.loading) return const CustomProgressIndicator();
          return Text(controller.error ?? '');
        }),
      ),
    );
  }
}
