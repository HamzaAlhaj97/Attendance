//import 'package:attendance_item/attendance/attendance_page.dart';
import 'package:attendance_item/features/attendance/presentation/pages/attendance_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          child: Scaffold(
            body: AttendancePage(),
          ),
        ),
      ),
    ),
  );
}
