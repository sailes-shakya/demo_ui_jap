import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';
import 'package:task_demo_ui/utils/two_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFA8B1FF),
      title: const Text('スタンプカード詳細', style: kAppBarTitleTextStyle),
      leading: IconButton(
        icon: Image.asset(MyAssets.icons.starIcon.path),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: Image.asset(MyAssets.icons.minusCircle.path),
          onPressed: () {},
        ),
      ],
    );
  }
}
