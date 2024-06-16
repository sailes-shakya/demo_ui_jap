import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/screen_three/controller/ImagePickerController.dart';
import 'package:task_demo_ui/utils/one_styles.dart';

class ImageSelectorWidget extends StatelessWidget {
  ImageSelectorWidget({
    required this.controller,
    required this.title,
    required this.subtitle,
  });

  final ImagePickerController controller;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kSectionTitleTextStyle,
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: kSubtitleTextStyle,
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: controller.pickImage,
                    ),
                  ),
                  ...controller.images.map((image) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: FileImage(File(image.path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              controller.removeImage(image);
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
