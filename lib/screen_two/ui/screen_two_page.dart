import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/screen_two/ui/widget/CustomAppBar.dart';
import 'package:task_demo_ui/screen_two/ui/widget/StampWidget.dart';
import 'package:task_demo_ui/utils/two_styles.dart';

import '../controller/stamp_controller.dart';

class ScreenTwoPage extends StatefulWidget {
  const ScreenTwoPage({Key? key}) : super(key: key);

  @override
  State<ScreenTwoPage> createState() => _ScreenTwoPageState();
}

class _ScreenTwoPageState extends State<ScreenTwoPage> {
  final StampController controller = Get.put(StampController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Color(0xFFA8B1FF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mer キッチン', style: kAppBarTitleTextStyle),
                  Obx(
                    () => Text(
                      '現在の獲得数 ${controller.totalStamps} 個',
                      style: kCurrentStampsTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: kContainerDecoration,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StampWidget(controller: controller),
                          SizedBox(width: 20),
                          StampWidget(controller: controller),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() => Text('2 / ${controller.currentPage} 枚目')),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('スタンプ獲得履歴', style: kStampHistoryTitleTextStyle),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10, // Mock data for stamp history
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              '2021 / 11 / ${18 - index}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              'スタンプを獲得しました。',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            trailing: Text(
                              '1個',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
