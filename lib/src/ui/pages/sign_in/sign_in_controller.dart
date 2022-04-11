import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/secure_storage.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/user_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class SignInController extends GetxController {
  SignInController(this._appController);

  final AppController _appController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool _visiblePassword = RxBool(false);

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeVisiblePassword() => _visiblePassword(!_visiblePassword.value);

  void signIn() {
    _appController.showOverlay(
      () async {
        try {
          final User? user = await const UserSQLite().findByUsername(
            usernameController.text.trim(),
          );
          if (user == null) {
            return _appController.showError('incorrectUsername'.tr);
          }
          if (!BCrypt.checkpw(passwordController.text, user.password)) {
            return _appController.showError('incorrectPassword'.tr);
          }
          _appController.user = user;
          if (passwordController.text != 'admin') {
            await const SecureStorage().saveCredentials(
              usernameController.text.trim(),
              passwordController.text,
            );
            Get.offNamed(RouteNames.home);
          } else {
            Get.offNamed(RouteNames.changePassword);
          }
        } catch (e) {
          _appController.showError(e.toString());
        }
      },
    );
  }

  bool get visiblePassword => _visiblePassword.value;
}
