import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';
import 'package:task_demo_ui/utils/one_styles.dart';

import 'custom_searchbar.dart';

Widget customSearchHeader(BuildContext context) {
  return Row(
    children: [
      Flexible(child: CustomSearchBar()),
      IconButton(onPressed: () {}, icon: MyAssets.icons.filter.image()),
      IconButton(onPressed: () {}, icon: MyAssets.icons.test.image())
    ],
  );
}

Widget customCalendar(
  BuildContext context,
  ValueChanged<DateTime> onDateChange,
) {
  return Column(
    children: [
      EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: onDateChange,
        activeColor: Colors.orange,
        locale: "ja",
      ),
      SizedBox(height: 8),
      Container(
        height: 45,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFAAA14),
              Color(0xffFFD78D)
            ], // replace with desired colors
          ),
        ),
        child: Center(
          child: Text(
            '2022年 5月 26日（木）',
            style: kDateTextStyle,
          ),
        ),
      ),
    ],
  );
}
