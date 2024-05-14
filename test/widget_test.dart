// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// class ContainerCreator extends StatefulWidget {
//   final String symbol;
//   final VoidCallback onTap;
//
//   final bool l;
//   final bool r;
//   final bool t;
//   final bool b;
//
//   ContainerCreator({
//     super.key,
//     required this.symbol,
//     required this.onTap,
//     this.l = true,
//     this.r = true,
//     this.t = true,
//     this.b = true,
//   });
//
//   @override
//   State<ContainerCreator> createState() => _ContainerCreatorState();
// }
//
// class _ContainerCreatorState extends State<ContainerCreator> {
//   bool isPressed = false;
//   bool isUserTurn1 = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return ZoomTapAnimation(
//       onTap: onTap,
//       child: Container(
//         width: 100.w,
//         height: 100.h,
//         padding: EdgeInsets.all(widget.isUserTurn ? 10.sp : 15.sp),
//         decoration: BoxDecoration(
//           color: Color(0xFF5A9B9B),
//           // border: Border(
//           //   bottom: BorderSide(
//           //     color: widget.b ? Color(0xFFDCB582) : Colors.white,
//           //     width: 3.sp,
//           //   ),
//           //   top: BorderSide(
//           //     color: widget.t ? Color(0xFFDCB582) : Colors.white,
//           //     width: 3.sp,
//           //   ),
//           //   left: BorderSide(
//           //     color: widget.l ? Color(0xFFDCB582) : Colors.white,
//           //     width: 3.sp,
//           //   ),
//           //   right: BorderSide(
//           //     color: widget.r ? Color(0xFFDCB582) : Colors.white,
//           //     width: 3.sp,
//           //   ),
//           // ),
//         ),
//         child: Center(
//           child: Text(
//             symbol,
//             style: TextStyle(fontSize: 36.sp, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<List<String>> grid = List.generate(3, (_) => List.filled(3, ''));

  bool isUserTurn = true;

  void onTapCell(int row, int col) {
    if (grid[row][col].isEmpty) {
      setState(() {
        grid[row][col] = isUserTurn ? 'X' : 'O';
        isUserTurn = !isUserTurn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9B9B),
      body: Column(
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 3; j++)
                  ContainerCreator(
                    symbol: grid[i][j],
                    onTap: () => onTapCell(i, j),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

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
