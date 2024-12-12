import 'package:attendance_item/features/attendance/data/models/attendance_model.dart';
import 'package:attendance_item/features/attendance/presentation/Widgets/history_list.dart';
import 'package:attendance_item/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const InlineRangeDatePicker(),
              // SizedBox(height: 10.h),
              10.verticalSpace,
              BlocProvider(
                create: (context) => AttendanceBloc(attendance: dummyAttendance)
                  ..add(GetAllAttendanceEvent()),
                child: SizedBox(height: 300.h, child: const HistoryList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
