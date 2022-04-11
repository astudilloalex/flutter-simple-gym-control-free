import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/customer_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';

class CustomerDetailController extends GetxController {
  CustomerDetailController(this._appController);

  final AppController _appController;

  final RxBool _loading = RxBool(true);
  final Rxn<Customer> _customer = Rxn<Customer>();

  final Rxn<DateTime> _startDate = Rxn<DateTime>();
  final Rxn<DateTime> _endDate = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      _loading(true);
      final int id = int.parse(Get.parameters['id']!);
      final Customer? customer = await const CustomerSQLite().findById(id);
      _customer(customer);
      _startDate(customer?.startDate);
      _endDate(customer?.endDate);
    } catch (e) {
      _appController.showError(e.toString());
    } finally {
      _loading(false);
    }
  }

  void updateCustomer(final Customer customer) {
    _customer(customer);
    _startDate(customer.startDate);
    _endDate(customer.endDate);
  }

  void updateDates() {
    if (validateEndDate() == null && validateStartDate() == null) {
      _appController.showOverlay(() async {
        try {
          final Customer? customer = await const CustomerSQLite().update(
            _customer.value!.copyWith(
              startDate: _startDate.value,
              endDate: _endDate.value,
            ),
          );
          if (customer != null) {
            _customer(customer.copyWith());
            Get.back();
          }
        } catch (e) {
          _appController.showError(e.toString());
        }
      });
    } else {
      _appController.showError(validateStartDate() ?? validateEndDate()!);
    }
  }

  String formattedDate(final DateTime dateTime) {
    return DateFormat(
      'EEEE\nMMM. d, yyyy',
      Get.deviceLocale?.languageCode ?? 'en',
    ).format(dateTime);
  }

  String formattedDateGlobal(final DateTime dateTime) {
    return _appController.dateFormat.format(dateTime);
  }

  String? validateEndDate() {
    final bool valid = _appController.inputValidations.validateDateGreater(
      _startDate.value,
      _endDate.value,
    );
    if (!valid) return 'endDateMustGreaterStartDate'.tr;
    return null;
  }

  String? validateStartDate() {
    final bool valid = _appController.inputValidations.validateDateGreaterEqual(
      _customer.value?.initialDate,
      _startDate.value,
    );
    if (!valid) return 'startDateMustGreaterInitialDate'.tr;
    return null;
  }

  set startDate(final DateTime? dateTime) {
    if (dateTime != null) {
      _startDate(dateTime);
      if (_endDate.value == _customer.value!.endDate) {
        _endDate(DateTime(dateTime.year, dateTime.month + 1, dateTime.day));
      }
    }
  }

  set endDate(final DateTime? dateTime) {
    if (dateTime != null) _endDate(dateTime);
  }

  bool get loading => _loading.value;
  Customer? get customer => _customer.value;

  DateTime? get startDate => _startDate.value;
  DateTime? get endDate => _endDate.value;
}
