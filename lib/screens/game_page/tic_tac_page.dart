import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_game/screens/game_page/widgets/container_creator.dart';
import 'package:tic_tac_toe_game/utils/extension/sized_box_extension.dart';

class TicTacGamePage extends StatefulWidget {
  final String userName;
  final int userChoice;

  TicTacGamePage({
    super.key,
    required this.userName,
    required this.userChoice,
  });

  @override
  State<TicTacGamePage> createState() => _TicTacGamePageState();
}

class _TicTacGamePageState extends State<TicTacGamePage> {
  int userPoints = 0;
  int computerPoints = 0;
  bool whoseTurn = false;
  List<List<String>> grid = List.generate(3, (_) => List.filled(3, ''));

  bool isUserTurn = true;

  void onTapCell(int row, int col) {
    if (grid[row][col].isEmpty) {
      setState(() {
        grid[row][col] = isUserTurn ? 'X' : 'O';
        isUserTurn = !isUserTurn;
      });
    }
    for (int i = 0; i < 3; i++) {
      if (grid[i][0] == 'X' && grid[i][1] == 'X' && grid[i][2] == 'X') {
        print('x won');
        win = true;
        setState(() {});
      }
      if (grid[0][i] == 'X' && grid[1][i] == 'X' && grid[2][i] == 'X') {
        print('x won');
        win = true;
        setState(() {});
      }
      if (grid[i][0] == 'O' && grid[i][1] == 'O' && grid[i][2] == 'O') {
        print('o won');
        win = true;
        setState(() {});
      }
      if (grid[0][i] == 'O' && grid[1][i] == 'O' && grid[2][i] == 'O') {
        print('o won');
        win = true;
        setState(() {});
      }
    }
  }

  bool win = false;

  void showMessage() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Siz yutdingiz!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  /// x 0 x
  /// x 0 x
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5A9B9B),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.h),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  widget.userName,
                  style: TextStyle(
                    color: Color(0xFF008287),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                5.height(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 50; i++) littleDotMaker(),
                  ],
                ),
                50.height(),
                Text(
                  'POINTS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.userName}',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: widget.userChoice == 0
                              ? Color(0xFF015E5F)
                              : Color(0xFFF0F0F1),
                        ),
                      ),
                      TextSpan(
                        text: '  $userPoints : $computerPoints  ',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDBB482),
                        ),
                      ),
                      TextSpan(
                        text: 'Bot',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: widget.userChoice == 1
                              ? Color(0xFF015E5F)
                              : Color(0xFFF0F0F1),
                        ),
                      ),
                    ],
                  ),
                ),
                50.height(),
                Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool funcWhoseTurn(bool turn) {
    turn = !turn;
    print(turn);
    return turn;
  }

  Widget littleDotMaker() {
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      height: 3.h,
      width: 3.w,
      decoration: BoxDecoration(
        color: Color(0xFFFAC100),
        shape: BoxShape.circle,
      ),
    );
  }
}
