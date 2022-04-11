import 'package:get/get.dart';

class InputValidations {
  const InputValidations();

  /// If [email] is correct return null otherwise return a message.
  String? validateEmail(final String? email) {
    if (email == null || !GetUtils.isEmail(email)) {
      return 'enterValidEmail'.tr;
    }
    return null;
  }

  /// If [idCard] is correct return null otherwise return a message.
  String? validateIdCard(final String? idCard) {
    if (idCard == null || idCard.length < 9) {
      return 'enterValidIdCard'.tr;
    }
    return null;
  }

  /// If [firstName] is correct return null otherwise return a message.
  String? validateFirstName(final String? firstName) {
    if (firstName == null || firstName.length < 3) {
      return 'enterValidFirstName'.tr;
    }
    return null;
  }

  /// If [lastName] is correct return null otherwise return a message.
  String? validateLastName(final String? lastName) {
    if (lastName == null || lastName.length < 3) {
      return 'enterValidLastName'.tr;
    }
    return null;
  }

  String? validatePhone(final String? phone) {
    if (phone == null || !GetUtils.isPhoneNumber(phone)) {
      return 'invalidPhoneNumber'.tr;
    }
    return null;
  }

  /// If [endDate] is greater than or equal to [startDate] returns true
  /// otherwise return false.
  bool validateDateGreaterEqual(
    final DateTime? startDate,
    final DateTime? endDate,
  ) {
    if (startDate == null || endDate == null) {
      return false;
    }
    if (endDate.difference(startDate).inDays < 0) {
      return false;
    }
    return true;
  }

  /// If [endDate] is greater than [startDate] returns true otherwise return false.
  bool validateDateGreater(
    final DateTime? startDate,
    final DateTime? endDate,
  ) {
    if (startDate == null || endDate == null) {
      return false;
    }
    if (endDate.difference(startDate).inDays <= 0) {
      return false;
    }
    return true;
  }
}
