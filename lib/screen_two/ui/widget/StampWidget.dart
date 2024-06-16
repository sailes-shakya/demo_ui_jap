import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';
import 'package:task_demo_ui/screen_two/controller/stamp_controller.dart';
import 'package:task_demo_ui/utils/two_styles.dart';

class StampWidget extends StatelessWidget {
  const StampWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final StampController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 240,
        width: MediaQuery.sizeOf(context).width * 0.85,
        decoration: kCardDecoration,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: controller.stamps.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 70,
                    height: 70,
                    child: Container(
                      decoration: kIconButtonDecoration.copyWith(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(MyAssets.icons.star1.path),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.toggleStamp(index);
                        },
                        icon: Icon(
                          controller.stamps[index] ? Icons.check : Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
