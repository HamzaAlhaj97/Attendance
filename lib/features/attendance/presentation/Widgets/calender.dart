import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class InlineRangeDatePicker extends StatelessWidget {
  const InlineRangeDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime focusedDay = DateTime.now();
    final DateTime rangeStart = DateTime.now();
    final DateTime rangeEnd = DateTime.now().add(const Duration(days: 2));

    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        ),
        TableCalendar(
          firstDay: DateTime(2020),
          lastDay: DateTime(2100),
          focusedDay: focusedDay,
          rangeStartDay: rangeStart,
          rangeEndDay: rangeEnd,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onDaySelected: (selectedDay, focusedDay) {},
          onRangeSelected: (start, end, focusedDay) {},
          calendarStyle: CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            rangeStartDecoration: const BoxDecoration(
              color: Color(0xffCA282C),
              shape: BoxShape.circle,
            ),
            rangeEndDecoration: const BoxDecoration(
              color: Color(0xffCA282C),
              shape: BoxShape.circle,
            ),
            withinRangeDecoration: BoxDecoration(
              color: const Color(0xffCA282C).withOpacity(0.2),
              shape: BoxShape.rectangle,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            decoration:
                const BoxDecoration(color: Color.fromARGB(0, 255, 255, 255)),
            titleTextStyle: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            leftChevronIcon: const Icon(Icons.chevron_left,
                color: Color.fromARGB(255, 0, 0, 0)),
            rightChevronIcon: const Icon(Icons.chevron_right,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    );
  }
}
