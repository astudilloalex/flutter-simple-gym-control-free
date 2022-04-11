import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  const HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<AppController>()),
    );
  }
}
