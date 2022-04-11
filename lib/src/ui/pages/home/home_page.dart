import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:simple_gym_control_free/src/ui/pages/home/responsive/home_phone.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      phone: HomePhone(),
    );
  }
}
