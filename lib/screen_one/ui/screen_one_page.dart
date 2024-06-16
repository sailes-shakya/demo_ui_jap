import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';
import 'package:task_demo_ui/screen_one/controller/screen_one_controller.dart';
import 'package:task_demo_ui/screen_one/ui/widgets/common_widgets.dart';

import '../../utils/one_styles.dart';

class ScreenOnepage extends StatefulWidget {
  const ScreenOnepage({super.key});

  @override
  State<ScreenOnepage> createState() => _ScreenOnepageState();
}

class _ScreenOnepageState extends State<ScreenOnepage> {
  final ScreenOneController controller = Get.put(ScreenOneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: Column(
          children: [
            customSearchHeader(context),
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customCalendar(context, (
                        selectedDate,
                      ) {
                        //[selectedDate] the new date selected.
                      }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white,
                                child: Column(children: [
                                  Image.asset(
                                    MyAssets.images.pic2.path,
                                    fit: BoxFit.fitWidth,
                                    width: MediaQuery.sizeOf(context).width,
                                  ),
                                  CardView(),
                                ]),
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFF6262),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4.0),
                                  child: Text('本日まで',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white,
                                child: Column(children: [
                                  Image.asset(
                                    MyAssets.images.pic2.path,
                                    fit: BoxFit.fitWidth,
                                    width: MediaQuery.sizeOf(context).width,
                                  ),
                                  CardView(),
                                ]),
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFF6262),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 4.0),
                                  child: Text('本日まで',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenOneController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）',
            style: kCardTitleTextStyle,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0x20EEAB40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '株式会社ひまわり倶楽部',
                    style: TextStyle(
                      color: Color(0xffEEAB40),
                    ),
                  ),
                ),
              ),
              Text('¥ 6,000', style: kPriceTextStyle),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text('東京都港区'),
              Text('2022年 5月 26日（木）'),
            ],
          ),
          SizedBox(height: 8),
          Text('北海道札幌市東雲町3丁目916番地17号'),
          SizedBox(height: 8),
          Row(
            children: [
              Text('交通費'),
              Text('300円'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '住宅型有料老人ホームひまわり倶楽部',
                style: TextStyle(color: Colors.grey),
              ),
              Obx(() => IconButton(
                    onPressed: () {
                      controller.toggleFavourite();
                    },
                    icon: controller.isFavourite.value
                        ? Image.asset(
                            MyAssets.icons.test.path,
                            width: 50,
                          )
                        : Image.asset(
                            MyAssets.icons.heart.path,
                            width: 50,
                          ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
