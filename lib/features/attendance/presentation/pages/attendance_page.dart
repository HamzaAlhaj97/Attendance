import 'package:attendance_item/features/attendance/presentation/Widgets/calender.dart';
import 'package:attendance_item/features/attendance/presentation/Widgets/history_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InlineRangeDatePicker(),
            // SizedBox(height: 10.h),
            10.verticalSpace,
            const HistoryList(),
          ],
        ),
      ),
    );
  }
}
