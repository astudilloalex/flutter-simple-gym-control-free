import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/widgets/customer_detail_edit_dates.dart';

class CustomerDetailDates extends StatelessWidget {
  const CustomerDetailDates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerDetailController controller =
        Get.find<CustomerDetailController>();
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'from'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Obx(() {
                  return Text(
                    controller.formattedDate(controller.customer!.startDate),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  );
                }),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.amber.withOpacity(0.5),
                  size: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    Get.dialog(const CustomerDetailEditDates());
                  },
                  splashRadius: 25.0,
                  icon: const Icon(Icons.edit_outlined),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'to'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Obx(() {
                  return Text(
                    controller.formattedDate(controller.customer!.endDate),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
