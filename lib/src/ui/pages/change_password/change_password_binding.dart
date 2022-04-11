import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  const ChangePasswordBinding();

  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(Get.find<AppController>()),
    );
  }
}
