import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find<AppController>()),
    );
  }
}
