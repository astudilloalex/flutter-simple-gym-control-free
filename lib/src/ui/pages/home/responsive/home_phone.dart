import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/widgets/home_customer_list.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/widgets/home_floating_button.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';
import 'package:simple_gym_control_free/src/ui/widgets/customer_search_delegate.dart';

class HomePhone extends StatelessWidget {
  const HomePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomerSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search_outlined),
            tooltip: 'search'.tr,
          ),
          const SizedBox(width: 3.0),
        ],
        centerTitle: true,
        title: Text('customers'.tr),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.loading) return const CustomProgressIndicator();
          return HomeCustomerList(customers: controller.customers);
        },
      ),
      floatingActionButton: const HomeFloatingButton(),
    );
  }
}
