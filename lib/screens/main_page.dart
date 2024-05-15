import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_game/screens/game_page/tic_tac_page.dart';
import 'package:tic_tac_toe_game/screens/game_page/widgets/button_creator.dart';
import 'package:tic_tac_toe_game/utils/extension/sized_box_extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static List<bool> isButtonsPressed = [
    false,
    false,
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController userInputController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9B9B),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// main icon
            Image.asset(
              'assets/icons/tic-tac-toe.png',
              height: 200.h,
              width: 200.w,
            ),
            30.height(),

            /// text field to enter name
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
            50.height(),
            Text(
              'Choose noughts or cross & start playing',
              style: TextStyle(
                color: Color(0xFFB7E2E8),
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            10.height(),

            /// choosing noughts or cross
            Container(
              width: double.infinity,
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCreator(
                    icoPath: 'assets/icons/x.png',
                    icoValue: 0,
                  ),
                  ButtonCreator(
                    icoPath: 'assets/icons/0.png',
                    icoValue: 1,
                  ),
                ],
              ),
            ),
            50.height(),

            /// start game button
            ZoomTapAnimation(
              onTap: () {
                if (userInputController.text.toString().trim().isNotEmpty &&
                    MainPage.isButtonsPressed.contains(true)) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return TicTacGamePage(
                          userName: userInputController.text,
                          userChoice: MainPage.isButtonsPressed[0] == true
                              ? 0
                              : 1, // 0 == 0 : 1 = X
                          computerPoints: 0,
                          userPoints: 0,
                        );
                      },
                    ),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Color(0xFFB7E2E8),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  'Start game!',
                  style: TextStyle(
                    color: Color(0xFF008287),
                    fontSize: 25.sp,
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
