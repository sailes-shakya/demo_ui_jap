import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/screen_three/ui/form_screen.dart';
import 'package:task_demo_ui/screen_two/ui/screen_two_page.dart';

import '../screen_one/ui/widgets/custom_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(CustomButtonBar());
            },
            child: Text('Screen one'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(ScreenTwoPage());
            },
            child: Text('Screen two'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(FormScreen());
            },
            child: Text('Screen three'),
          ),
        ],
      ),
    );
  }
}
