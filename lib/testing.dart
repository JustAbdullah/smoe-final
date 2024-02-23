import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';

class TestingNumber extends StatelessWidget {
  const TestingNumber({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        body: Column(
      children: [
        Text(""),
        Text(""),
        InkWell(
          onTap: () {},
          child: Container(child: Text("")),
        )
      ],
    ));
  }
}
