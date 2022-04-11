import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';

class AddCustomerBinding implements Bindings {
  const AddCustomerBinding();

  @override
  void dependencies() {
    Get.lazyPut<AddCustomerController>(
      () => AddCustomerController(
        Get.find<AppController>(),
        Get.find<HomeController>(),
      ),
    );
  }
}
