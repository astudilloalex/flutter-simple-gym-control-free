import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';

class CustomerDetailBinding implements Bindings {
  const CustomerDetailBinding();

  @override
  void dependencies() {
    Get.lazyPut<CustomerDetailController>(
      () => CustomerDetailController(Get.find<AppController>()),
    );
  }
}
