import 'package:bcrypt/bcrypt.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/secure_storage.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/user_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class SplashController extends GetxController {
  SplashController(this._appController);

  final AppController _appController;

  final RxBool _loading = RxBool(true);
  final RxnString _error = RxnString();

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    try {
      final Map<String, String>? data = await const SecureStorage().credentials;
      if (data == null) {
        return Get.offNamed(RouteNames.signIn);
      }
      final User? user = await const UserSQLite().findByUsername(
        data['username']!,
      );
      if (user == null) {
        return Get.offNamed(RouteNames.signIn);
      }
      if (!BCrypt.checkpw(data['password']!, user.password)) {
        return Get.offNamed(RouteNames.signIn);
      }
      _appController.user = user;
      return Get.offNamed(RouteNames.home);
    } catch (e) {
      _error(e.toString());
    } finally {
      _loading(false);
    }
  }

  bool get loading => _loading.value;
  String? get error => _error.value;
}
