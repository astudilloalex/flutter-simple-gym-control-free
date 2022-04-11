import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/customer_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';

class AddCustomerController extends GetxController {
  AddCustomerController(this._appController, this._homeController);

  final AppController _appController;
  final HomeController _homeController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController idCardController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final RxBool _loading = RxBool(true);
  final int? _id = int.tryParse(Get.parameters['id'] ?? '');

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  @override
  void onClose() {
    idCardController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    initialDateController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }

  Future<void> _load() async {
    if (_id != null) {
      try {
        final Customer? customer = await const CustomerSQLite().findById(_id!);
        if (customer != null) {
          idCardController.text = customer.idCard;
          firstNameController.text = customer.firstName;
          lastNameController.text = customer.lastName;
          emailController.text = customer.email ?? '';
          phoneController.text = customer.phone ?? '';
          initialDateController.text = _appController.dateFormat.format(
            customer.initialDate,
          );
          startDateController.text = _appController.dateFormat.format(
            customer.startDate,
          );
          endDateController.text = _appController.dateFormat.format(
            customer.endDate,
          );
        }
      } on Exception catch (e) {
        _appController.showError(e.toString());
      }
    }
  }

  void save() {
    if (formKey.currentState!.validate()) {
      _appController.showOverlay(() async {
        try {
          final Customer? customer = _id != null
              ? await const CustomerSQLite().update(
                  Customer(
                    id: _id!,
                    endDate:
                        _appController.dateFormat.parse(endDateController.text),
                    firstName: firstNameController.text.trim(),
                    idCard: idCardController.text.trim(),
                    initialDate: _appController.dateFormat.parse(
                      initialDateController.text,
                    ),
                    email: emailController.text.trim().isEmpty
                        ? null
                        : emailController.text.trim(),
                    phone: phoneController.text.trim().isEmpty
                        ? null
                        : phoneController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    startDate: _appController.dateFormat.parse(
                      startDateController.text,
                    ),
                  ),
                )
              : await const CustomerSQLite().save(
                  Customer(
                    endDate:
                        _appController.dateFormat.parse(endDateController.text),
                    firstName: firstNameController.text.trim(),
                    idCard: idCardController.text.trim(),
                    initialDate: _appController.dateFormat.parse(
                      initialDateController.text,
                    ),
                    email: emailController.text.trim().isEmpty
                        ? null
                        : emailController.text.trim(),
                    phone: phoneController.text.trim().isEmpty
                        ? null
                        : phoneController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    startDate: _appController.dateFormat.parse(
                      startDateController.text,
                    ),
                  ),
                );
          if (customer != null) {
            await _homeController.load();
            if (_id == null) {
              Get.until((route) => route.isFirst);
            } else {
              Get.find<CustomerDetailController>().updateCustomer(customer);
              Get.back();
            }
          }
        } catch (e) {
          _appController.showError(e.toString());
        }
      });
    }
  }

  void updateInitialDate(final DateTime? dateTime) {
    if (dateTime != null) {
      initialDateController.text = _appController.dateFormat.format(dateTime);
    }
  }

  void updateStartDate(final DateTime? dateTime) {
    if (dateTime != null) {
      startDateController.text = _appController.dateFormat.format(dateTime);
      if (endDateController.text.trim().isEmpty) {
        updateEndDate(
          DateTime(dateTime.year, dateTime.month + 1, dateTime.day),
        );
      }
      if (initialDateController.text.trim().isEmpty) {
        updateInitialDate(dateTime);
      }
    }
  }

  void updateEndDate(final DateTime? dateTime) {
    if (dateTime != null) {
      endDateController.text = _appController.dateFormat.format(dateTime);
    }
  }

  String? validateEmail(final String? email) {
    if (email == null || email.trim().isEmpty) return null;
    return _appController.inputValidations.validateEmail(email);
  }

  String? validateIdCard(final String? idCard) {
    return _appController.inputValidations.validateIdCard(idCard);
  }

  String? validateFirstName(final String? firstName) {
    return _appController.inputValidations.validateFirstName(firstName);
  }

  String? validateLastName(final String? lastName) {
    return _appController.inputValidations.validateLastName(lastName);
  }

  String? validatePhoneNumber(final String? phone) {
    if (phone == null || phone.trim().isEmpty) return null;
    return _appController.inputValidations.validatePhone(phone);
  }

  String? validateStartDate(final String? startDate) {
    final bool valid = initialDateController.text.trim().isNotEmpty &&
        _appController.inputValidations.validateDateGreaterEqual(
          _appController.dateFormat.parse(initialDateController.text),
          startDate == null ? null : _appController.dateFormat.parse(startDate),
        );
    if (!valid) return 'startDateMustGreaterInitialDate'.tr;
    return null;
  }

  String? validateEndDate(final String? endDate) {
    final bool valid = startDateController.text.trim().isNotEmpty &&
        _appController.inputValidations.validateDateGreater(
          _appController.dateFormat.parse(startDateController.text),
          endDate == null ? null : _appController.dateFormat.parse(endDate),
        );
    if (!valid) return 'endDateMustGreaterStartDate'.tr;
    return null;
  }

  bool get loading => _loading.value;
}
