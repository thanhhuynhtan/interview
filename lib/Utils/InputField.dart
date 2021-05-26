import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget inputField({
  required TextEditingController controller,
  required String hintText,
  required bool obscure,
  required void Function(String value)? onChanged,
  required String? Function(String? value)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    onChanged: onChanged,
    validator: validator,
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
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.sp,
        ),
        borderRadius: BorderRadius.zero,
      ),
      focusedErrorBorder: OutlineInputBorder(
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
