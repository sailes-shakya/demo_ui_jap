import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/screen_three/model/checkbox_model.dart';
import 'package:task_demo_ui/utils/one_styles.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({
    super.key,
    required this.title,
    required this.list,
    required this.toggleCheckbox,
  });

  final String title;
  final Function(int index) toggleCheckbox;
  final RxList<CheckBoxModel> list;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kSectionTitleTextStyle),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List<Widget>.generate(list.length, (int index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.orange,
                        value: list[index].isChecked,
                        onChanged: (bool? value) {
                          if (value != null) {
                            toggleCheckbox(index);
                          }
                        },
                      ),
                    ),
                    Text(list[index].title),
                  ],
                );
              }),
            )
          ],
        ));
  }
}
