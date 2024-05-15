import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe_game/screens/game_page/widgets/container_creator.dart';
import 'package:tic_tac_toe_game/utils/extension/sized_box_extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TicTacGamePage extends StatefulWidget {
  final String userName;
  final int userChoice;
  int userPoints;
  int computerPoints;

  TicTacGamePage({
    super.key,
    required this.userName,
    required this.userChoice,
    required this.userPoints,
    required this.computerPoints,
  });

  @override
  State<TicTacGamePage> createState() => _TicTacGamePageState();
}

class _TicTacGamePageState extends State<TicTacGamePage> {
  List<List<String>> grid = List.generate(3, (_) => List.filled(3, ''));

  bool isUserTurn = true;
  bool won = false;

  void onTapCell(int row, int col) {
    if (grid[row][col].isEmpty) {
      setState(() {
        grid[row][col] = isUserTurn ? 'X' : 'O';
        isUserTurn = !isUserTurn;
      });
    }
    for (int i = 0; i < 3; i++) {
      if (grid[i][0] == 'X' && grid[i][1] == 'X' && grid[i][2] == 'X') {
        setState(() {
          showMessage('x');
          won = true;
        });
      }
      if (grid[0][i] == 'X' && grid[1][i] == 'X' && grid[2][i] == 'X') {
        setState(() {
          showMessage('x');
          won = true;
        });
      }
      if (grid[i][0] == 'O' && grid[i][1] == 'O' && grid[i][2] == 'O') {
        setState(() {
          showMessage('o');
          won = true;
        });
      }
      if (grid[0][i] == 'O' && grid[1][i] == 'O' && grid[2][i] == 'O') {
        setState(() {
          showMessage('o');
          won = true;
        });
      }
      if (grid[0][0] == 'O' && grid[1][1] == 'O' && grid[2][2] == 'O') {
        setState(() {
          showMessage('o');
          won = true;
        });
      }
      if (grid[0][0] == 'X' && grid[1][1] == 'X' && grid[2][2] == 'X') {
        setState(() {
          showMessage('x');
          won = true;
        });
      }
      if (grid[0][2] == 'X' && grid[1][1] == 'X' && grid[2][0] == 'X') {
        setState(() {
          showMessage('x');
          won = true;
        });
      }
      if (grid[0][2] == 'O' && grid[1][1] == 'O' && grid[2][0] == 'O') {
        setState(() {
          showMessage('o');
          won = true;
        });
      }
    }
  }

  void showMessage(String whoWon) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("Siz yutdingiz! $whoWon"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: buttonNewGape(whoWon),
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
                        text:
                            '  ${widget.userPoints} : ${widget.computerPoints}  ',
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
          50.height(),
          buttonNewGape(''),
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

  Widget buttonNewGape(String whoWon) {
    if (won) {
      if (whoWon == 'x') {
        widget.userPoints += 1;
      } else if (whoWon == 'o') {
        widget.computerPoints += 1;
      }
    }

    return ZoomTapAnimation(
      onTap: () {
        setState(
          () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return TicTacGamePage(
                    userName: widget.userName,
                    userChoice: widget.userChoice,
                    userPoints: widget.userPoints,
                    computerPoints: widget.computerPoints,
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        height: 50.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: Color(0xFF015E5F),
            borderRadius: BorderRadius.circular(15.r)),
        child: Center(
          child: Text(
            'New Game!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
