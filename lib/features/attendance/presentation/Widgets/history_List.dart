import 'package:attendance_item/features/attendance/presentation/Widgets/error_widget.dart';
import 'package:attendance_item/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'attendance_widget.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is ErrorState) {
          return const MyErrorWidget(
              message: 'Something went wrong, Please try later!');
        } else if (state is LoadedState) {
          return AttendanceWidget(attendanceData: state.attendance);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
