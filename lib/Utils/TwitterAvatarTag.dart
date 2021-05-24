import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TwitterAvatarTag extends StatelessWidget {
  final asset;
  final name;
  final tag;

  const TwitterAvatarTag({
    Key? key,
    this.asset,
    this.name,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 25.sp,
            width: 25.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            height: 25.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  ),
                ),
                Text(
                  tag,
                  style: GoogleFonts.roboto(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
