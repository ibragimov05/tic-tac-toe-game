import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_game/screens/main_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ButtonCreator extends StatefulWidget {
  final String icoPath;
  final int icoValue;

  ButtonCreator({super.key, required this.icoPath, required this.icoValue});

  @override
  State<ButtonCreator> createState() => _ButtonCreatorState();
}

class _ButtonCreatorState extends State<ButtonCreator> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        setState(() {
          if (MainPage.isButtonsPressed[0] == true && widget.icoValue == 1) {
            MainPage.isButtonsPressed[widget.icoValue] =
                !MainPage.isButtonsPressed[widget.icoValue];
          } else if (MainPage.isButtonsPressed[1] == true &&
              widget.icoValue == 0) {
            MainPage.isButtonsPressed[widget.icoValue] =
                !MainPage.isButtonsPressed[widget.icoValue];
          }
          MainPage.isButtonsPressed[widget.icoValue] =
              !MainPage.isButtonsPressed[widget.icoValue];

          // isTapped = !isTapped;
          print(MainPage.isButtonsPressed);
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.sp),
        width: 160.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MainPage.isButtonsPressed[widget.icoValue]
              ? Color(0xFF79D6DF)
              : Color(0xFF008287),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Image.asset(widget.icoPath),
      ),
    );
  }
}
