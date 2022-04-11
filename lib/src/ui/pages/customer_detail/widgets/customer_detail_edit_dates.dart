import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/customer_detail/customer_detail_controller.dart';
import 'package:simple_gym_control_free/src/ui/utilities/date_picker.dart';

class CustomerDetailEditDates extends StatelessWidget {
  const CustomerDetailEditDates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerDetailController controller =
        Get.find<CustomerDetailController>();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('startDate'.tr),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: Colors.black.withOpacity(0.25)),
              ),
              child: ListTile(
                onTap: () => showCustomDatePicker(
                  context,
                ).then((value) => controller.startDate = value),
                title: Obx(() {
                  return Text(
                    controller.formattedDateGlobal(
                      controller.startDate ?? DateTime.now(),
                    ),
                  );
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const Divider(),
            Text('endDate'.tr),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: Colors.black.withOpacity(0.25)),
              ),
              child: ListTile(
                onTap: () => showCustomDatePicker(
                  context,
                ).then((value) => controller.endDate = value),
                title: Obx(() {
                  return Text(
                    controller.formattedDateGlobal(
                      controller.endDate ?? DateTime.now(),
                    ),
                  );
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const Divider(),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.update_outlined),
                onPressed: controller.updateDates,
                label: Text('update'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
