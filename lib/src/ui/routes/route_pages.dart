import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_page.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/change_password_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/change_password/change_password_page.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_page.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_page.dart';
import 'package:simple_gym_control_free/src/ui/pages/sign_in/sign_in_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/sign_in/sign_in_page.dart';
import 'package:simple_gym_control_free/src/ui/pages/splash/splash_binding.dart';
import 'package:simple_gym_control_free/src/ui/pages/splash/splash_page.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class RoutePages {
  const RoutePages._();

  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: RouteNames.addCustomer,
        page: () => const AddCustomerPage(),
        binding: const AddCustomerBinding(),
      ),
      GetPage(
        name: RouteNames.changePassword,
        page: () => const ChangePasswordPage(),
        binding: const ChangePasswordBinding(),
      ),
      GetPage(
        name: RouteNames.customerDetail,
        page: () => const CustomerDetailPage(),
        binding: const CustomerDetailBinding(),
      ),
      GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
        binding: const HomeBinding(),
      ),
      GetPage(
        name: RouteNames.signIn,
        page: () => const SignInPage(),
        binding: const SignInBinding(),
      ),
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashPage(),
        binding: const SplashBinding(),
      ),
    ];
  }
}
