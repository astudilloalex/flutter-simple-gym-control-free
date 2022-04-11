import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/sign_in/sign_in_controller.dart';

class SignInBinding implements Bindings {
  const SignInBinding();
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(Get.find<AppController>()),
    );
  }
}
