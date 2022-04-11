import 'package:simple_gym_control_free/src/domain/repositories/translation_repository.dart';

class AppEnUs implements TranslationRepository {
  const AppEnUs();

  @override
  Map<String, String> get data {
    return {
      'addCustomer': 'Add customer',
      'addEmployee': 'Add employee',
      'addNewCustomer': 'Add new customer',
      'confirmNewPassword': 'Confirm new password',
      'currentPassword': 'Current password',
      'customer': 'Customer',
      'customers': 'Customers',
      'customerDetail': 'Customer detail',
      'email': 'Email',
      'employee': 'Employee',
      'endDate': 'End date',
      'endDateMustGreaterStartDate':
          'The end date must be greater than the start date',
      'enterValidEmail': 'Enter a valid email',
      'enterValidFirstName': 'Enter a valid first name',
      'enterValidIdCard': 'Enter a valid ID Card',
      'enterValidLastName': 'Enter a valid last name',
      'entryDate': 'Entry date',
      'errorLoadingData': 'Error loading data',
      'firstName': 'First name',
      'from': 'From',
      'idCard': 'Id card',
      'initialDate': 'Initial date',
      'invalidCurrentPassword': 'Invalid current password',
      'invalidDate': 'Invalid date',
      'incorrectPassword': 'Incorrect password',
      'incorrectUsername': 'Incorrect username',
      'lastName': 'Last name',
      'loading': 'Loading',
      'newPassword': 'New password',
      'openTheAppAgain': 'Open the app again',
      'password': 'Password',
      'phone': 'Phone',
      'resetPassword': 'Reset password',
      'save': 'Save',
      'search': 'Search',
      'signIn': 'Sign in',
      'startDate': 'Start date',
      'startDateMustGreaterInitialDate':
          'The start date must be greater than or equal to the initial date',
      'theNewPasswordNotMatch': 'The new password does not match',
      'to': 'To',
      'tryAgain': 'Try again',
      'updatePassword': 'Update password',
      'username': 'Username',
      'validFrom': 'Valid from',
      'validUntil': 'Valid until',
    };
  }
}
