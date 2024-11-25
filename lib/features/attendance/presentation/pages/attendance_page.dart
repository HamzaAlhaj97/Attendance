import 'package:attendance_item/features/attendance/presentation/Widgets/history_List.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Calender Widget'),
          SizedBox(height: 50),
          HistoryList(),
        ],
      ),
    );
  }
}
