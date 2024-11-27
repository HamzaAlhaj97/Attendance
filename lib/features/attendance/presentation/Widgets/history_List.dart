import 'package:attendance_item/features/attendance/presentation/Widgets/styled_column.dart';
import 'package:attendance_item/features/attendance/presentation/Widgets/styled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
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

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  Future<List<dynamic>> loadJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/attendancedata.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData['attendance'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: loadJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No attendance data found'));
        } else {
          final attendanceData = snapshot.data!;
          return SizedBox(
            height: 300.w,
            child: ListView.builder(
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
                                record['arrivalTime'] ?? '',
                                record['leavingTime'] ?? ''),
                              dayNumber: record['dayNumber'] ?? '',
                              dayShort: record['dayShort'] ?? '',
                            ),
                          ],
                        ),
                       20.horizontalSpace,
                        StyledColumn(
                            record: record['arrivalTime'] ?? '',
                            placeHolder: 'Punch In'),
                        20.verticalSpace,
                        StyledColumn(
                            record: record['leavingTime'] ?? '',
                            placeHolder: 'Punch Out'),
                        20.verticalSpace,
                        StyledColumn(
                            record: calculateTotalHours(
                                record['arrivalTime'] ?? '',
                                record['leavingTime'] ?? ''),
                            placeHolder: 'Total Hours'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
