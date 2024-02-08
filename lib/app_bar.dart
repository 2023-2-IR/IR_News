import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// appBar 구현
    double widthSize = MediaQuery.of(context).size.width;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// nara 로고
            Container(
              child: Text(
                'NARA',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  fontSize: 30,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 10.0, // 흐림 정도
                      spreadRadius: 5.0, // 그림자 확장 정도
                      offset: Offset(2.0, 2.0), // 그림자 위치 (가로, 세로)
                    ),
                  ],
                ),
              ),
            ),

            /// 이름, 로그인, 로그아웃
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('정윤석님', style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
                    decorationThickness: 3,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: 120,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
