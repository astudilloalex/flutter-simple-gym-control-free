import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/user_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController(this._appController);

  final AppController _appController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }

  void changePassword() {
    _appController.showOverlay(() async {
      try {
        final String? userPassword = _appController.user?.password;
        if (userPassword == null) {
          return _appController.showError('openTheAppAgain'.tr);
        }
        if (!BCrypt.checkpw(currentPasswordController.text, userPassword)) {
          return _appController.showError('invalidCurrentPassword'.tr);
        }
        if (newPasswordController.text != repeatPasswordController.text) {
          return _appController.showError('theNewPasswordNotMatch'.tr);
        }
        final User user = _appController.user!.copyWith(
          password: BCrypt.hashpw(
            newPasswordController.text,
            BCrypt.gensalt(),
          ),
        );
        _appController.user = await const UserSQLite().updateUser(user);
        if (_appController.user == null) {
          Get.offAllNamed(RouteNames.signIn);
        } else {
          Get.offAllNamed(RouteNames.home);
        }
      } catch (e) {
        _appController.showError(e.toString());
      }
    });
  }
}
