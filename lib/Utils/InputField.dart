import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget inputField({
  required TextEditingController controller,
  required String hintText,
  required bool obscure,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.sp,
        ),
        borderRadius: BorderRadius.zero,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.sp,
        ),
        borderRadius: BorderRadius.zero,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 5.w,
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.roboto(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w400,
        fontSize: 12.5.sp,
      ),
    ),
    style: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12.5.sp,
    ),
  );
}
