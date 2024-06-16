import 'package:flutter/material.dart';

final kButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.orange,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

final kInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

final kSectionTitleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final kSubtitleTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);

final kContainerDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(8),
);

const kFormPadding = EdgeInsets.symmetric(vertical: 8.0);

const kFormLabelStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
