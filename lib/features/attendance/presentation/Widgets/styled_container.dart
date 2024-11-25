import 'package:attendance_item/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer(
      {super.key, required this.dayNumber, required this.dayShort});
  final dynamic dayNumber;
  final dynamic dayShort;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff6FAB55),
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
