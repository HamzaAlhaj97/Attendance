import 'package:attendance_item/features/attendance/data/models/attendance_model.dart';
import 'package:attendance_item/features/attendance/presentation/Widgets/styled_column_widget.dart';
import 'package:attendance_item/features/attendance/presentation/Widgets/styled_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

String calculateTotalHours(String arrivalTime, String leavingTime) {
  if (arrivalTime == "" || leavingTime == "") {
    return '';
  }
  final DateFormat format = DateFormat("hh:mm a");
  final DateTime arrival = format.parse(arrivalTime);
  final DateTime leaving = format.parse(leavingTime);

  final duration = leaving.difference(arrival);

  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({super.key,required this.attendanceData});
  final List <Attendance> attendanceData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount: attendanceData.length,
              itemBuilder: (context, index) {
                final record = attendanceData[index];
                return Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 12),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            StyledContainer(totalHours: calculateTotalHours(
                                record.arrivalTime,
                                record.leavingTime),
                              dayNumber: record.dayNumber,
                              dayShort: record.dayShort,
                            ),
                          ],
                        ),
                       20.horizontalSpace,
                        StyledColumn(
                            record: record.arrivalTime,
                            placeHolder: 'Punch In'),
                        20.verticalSpace,
                        StyledColumn(
                            record: record.leavingTime,
                            placeHolder: 'Punch Out'),
                        20.verticalSpace,
                        StyledColumn(
                            record: calculateTotalHours(
                                record.arrivalTime,
                                record.leavingTime),
                            placeHolder: 'Total Hours'),
                      ],
                    ),
                  ),
                );
              },
            );
  }
}