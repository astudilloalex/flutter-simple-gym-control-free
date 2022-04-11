import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';

class CustomerDetailError extends StatelessWidget {
  const CustomerDetailError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'errorLoadingData'.tr,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          OutlinedButton.icon(
            onPressed: Get.find<CustomerDetailController>().load,
            icon: const Icon(Icons.refresh_outlined),
            label: Text('tryAgain'.tr),
          ),
        ],
      ),
    );
  }
}
