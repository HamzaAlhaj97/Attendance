import 'package:attendance_item/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer(
      {super.key, required this.dayNumber, required this.dayShort,required this.totalHours});
  final dynamic dayNumber;
  final dynamic dayShort;
  final String totalHours;

TimeOfDay stringToTimeOfDay(String timeString) {
  final parts = timeString.split(':');
  return TimeOfDay(
    hour: int.parse(parts[0]),
    minute: int.parse(parts[1]),
  );
}

TimeOfDay getTotalAsTime(){
  TimeOfDay time = stringToTimeOfDay(totalHours);
  return time;
}

Color getContainerColor(){
  TimeOfDay time = getTotalAsTime();
  if (time.hour < 8 ){
    return const Color(0xffE9484C);
  } else if (time.hour == 8 && (time.minute >=00 && time.minute <= 30)){
    return const Color(0xff6FAB55);
  }
  return const Color(0xffE89C1E);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: getContainerColor()
      ),
      child: Column(
        children: [
          Text(
            dayNumber,
            style: TextStyle(
              fontSize: 19.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.roboto,
            ),
          ),
          Text(
            dayShort,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.roboto,
            ),
          ),
        ],
      ),
    );
  }
}
