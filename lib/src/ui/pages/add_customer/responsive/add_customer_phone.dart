import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/add_customer_controller.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_button.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_email_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_end_date_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_first_name_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_id_card_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_init_date_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_last_name_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_phone_input.dart';
import 'package:simple_gym_control_free/src/ui/pages/add_customer/widgets/add_customer_start_date_input.dart';

class AddCustomerPhone extends StatelessWidget {
  const AddCustomerPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddCustomerController controller = Get.find<AddCustomerController>();
    final List<Widget> widgets = <Widget>[
      const SizedBox(height: 16.0),
      Form(
        key: controller.formKey,
        child: Column(
          children: const <Widget>[
            AddCustomerIdCardInput(),
            SizedBox(height: 16.0),
            AddCustomerFirstNameInput(),
            SizedBox(height: 16.0),
            AddCustomerLastNameInput(),
            SizedBox(height: 16.0),
            AddCustomerEmailInput(),
            SizedBox(height: 16.0),
            AddCustomerPhoneInput(),
            SizedBox(height: 16.0),
            AddCustomerStartDateInput(),
            SizedBox(height: 16.0),
            AddCustomerEndDateInput(),
            Divider(),
            SizedBox(height: 20.0),
            AddCustomerInitDateInput(),
          ],
        ),
      ),
      const SizedBox(height: 16.0),
      const AddCustomerButton(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('addCustomer'.tr),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widgets[index],
          );
        },
      ),
    );
  }
}
