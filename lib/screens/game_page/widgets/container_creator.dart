
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ContainerCreator extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;

  const ContainerCreator({
    required this.symbol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: Color(0xFF5A9B9B),
          border: Border.all(color: Color(0xFFDCB582), width: 3.sp),
        ),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(fontSize: 36.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
