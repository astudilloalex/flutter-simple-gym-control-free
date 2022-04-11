import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/widgets/customer_detail_dates.dart';

class CustomerDetailInfo extends StatelessWidget {
  const CustomerDetailInfo({
    Key? key,
    required this.customer,
  }) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      const SizedBox(height: 16.0),
      const CustomerDetailDates(),
      const SizedBox(height: 16.0),
      Text(
        'idCard'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        customer.idCard,
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
      const SizedBox(height: 20.0),
      Text(
        'firstName'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        customer.firstName,
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
      const SizedBox(height: 20.0),
      Text(
        'lastName'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        customer.lastName,
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
      const SizedBox(height: 20.0),
      Text(
        'email'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        customer.email ?? '---',
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
      const SizedBox(height: 20.0),
      Text(
        'phone'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        customer.phone ?? '---',
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
      const SizedBox(height: 20.0),
      Text(
        'initialDate'.tr,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Text(
        Get.find<CustomerDetailController>()
            .formattedDateGlobal(customer.initialDate),
        style: const TextStyle(fontSize: 18.0),
      ),
      const Divider(height: 8.0),
    ];
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: widgets[index],
        );
      },
    );
  }
}
