import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/home_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/widgets/home_customer_list.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/widgets/home_floating_button.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text('search'.tr),
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        if (controller.loading) {
                          return const CustomProgressIndicator();
                        }
                        return HomeCustomerList(
                          customers: controller.customers,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 9,
              child: Center(
                child: Text('hi'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const HomeFloatingButton(),
    );
  }
}
