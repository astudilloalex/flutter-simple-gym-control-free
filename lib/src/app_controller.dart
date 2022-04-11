import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';
import 'package:simple_gym_control_free/src/ui/utilities/input_validations.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';
import 'package:simple_gym_control_free/src/ui/widgets/snackbar/error_snackbar.dart';

class AppController extends GetxController {
  AppController(this._inputValidations);

  final InputValidations _inputValidations;
  final DateFormat _dateFormat = DateFormat(
    'MMMM d, yyyy',
    Get.deviceLocale?.languageCode ?? 'en',
  );

  User? user;

  void showError(final String error) {
    if (Get.isSnackbarOpen) Get.back();
    Get.showSnackbar(ErrorSnackbar(error));
  }

  void showOverlay(final Future Function() asyncFunction) {
    Get.showOverlay(
      loadingWidget: const CustomProgressIndicator(),
      asyncFunction: asyncFunction,
    );
  }

  InputValidations get inputValidations => _inputValidations;
  DateFormat get dateFormat => _dateFormat;
}
