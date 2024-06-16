import 'package:flutter/material.dart';

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kCurrentStampsTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

const kStampHistoryTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
);

const kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  boxShadow: [
    BoxShadow(
      color: Color(0x7F888888),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 3),
    ),
  ],
);

const kIconButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
);
