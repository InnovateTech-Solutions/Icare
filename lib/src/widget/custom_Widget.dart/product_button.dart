import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_part/src/constant/color.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({required this.title, required this.onTap, Key? key})
      : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 50.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: ColorConstants.secondaryScaffoldBacground),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorConstants.mainTextColor)),
          ),
        ),
      ),
    );
  }
}
