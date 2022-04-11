import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_controller.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/customer_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/domain/entities/user.dart';

class HomeController extends GetxController {
  HomeController(this._appController);

  final AppController _appController;

  final List<Customer> _customers = [];

  bool _loading = true;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      _customers.clear();
      _customers.addAll(await const CustomerSQLite().findAll());
    } finally {
      _loading = false;
      update();
    }
  }

  String formattedDate(final DateTime dateTime) {
    return _appController.dateFormat.format(dateTime);
  }

  List<Customer> get customers => _customers;
  bool get loading => _loading;
  User? get user => _appController.user;
}
