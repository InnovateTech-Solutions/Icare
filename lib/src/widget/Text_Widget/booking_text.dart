import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_part/src/constant/color.dart';

bookingMainText(String title) {
  return Text(title,
      textAlign: TextAlign.start,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: ColorConstants.greyColor)));
}

phoneText(VoidCallback ontap, String title) {
  return Container(
    child: GestureDetector(
      onTap: ontap,
      child: Text(title,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.greyColor))),
    ),
  );
}

serviceText(String title) {
  return Text(title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstants.mainTextColor)));
}

dateText(String title) {
  return Text(title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: ColorConstants.mainTextColor)));
}

noteText(String title) {
  return Text(title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstants.greyColor)));
}
