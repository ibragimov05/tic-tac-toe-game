import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_game/screens/game_page/tic_tac_page.dart';
import 'package:tic_tac_toe_game/utils/extension/sized_box_extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController userInputController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9B9B),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF008287),
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  TextField(
                    controller: userInputController,
                    cursorColor: Color(0xFFB7E2E8),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter your name',
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF8FCAD1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: TextStyle(color: Color(0xFFB7E2E8)),
                  ),
                ],
              ),
            ),
            15.height(),
            ZoomTapAnimation(
              onTap: () {
                if (userInputController.text.toString().trim().isNotEmpty) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return TicTacGamePage(
                          userName: userInputController.text,
                        );
                      },
                    ),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: Color(0xFFB7E2E8),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'Start game!',
                  style: TextStyle(
                    color: Color(0xFF008287),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
