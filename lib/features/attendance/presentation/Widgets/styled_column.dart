import 'package:attendance_item/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledColumn extends StatelessWidget {
  const StyledColumn(
      {super.key, required this.record, required this.placeHolder});
  final String placeHolder;
  final dynamic record;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          record,
          style: TextStyle(
            fontFamily: FontFamily.roboto,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff293646),
          ),
        ),
        Text(
          placeHolder,
          style: TextStyle(
            fontFamily: FontFamily.roboto,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff6A7D94),
          ),
        ),
      ],
    );
  }
}
