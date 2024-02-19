import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * 0.2, bottom: deviceHeight * 0.1),
                child: Text(
                  'NARA',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    fontSize: 40,
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
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 11),
                  ),
                ),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 11),
                  ),
                ),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' Password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 11),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 35)),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                        0xFFF4F0C9)), // 배경색을 노란색으로 설정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.black, // 테두리 색상을 검은색으로 설정
                          width: 0.7, // 테두리 두께를 조절 (원하는 수치로 조절)
                        ),// 테두리 둥글기 설정 (원하는 수치로 조절)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle( // 텍스트 스타일 지정
                      color: Colors.black, // 텍스트 색상을 검은색으로 설정
                      fontSize: 15, // 텍스트 크기를 조절 (원하는 수치로 조절)
                      fontWeight: FontWeight.w600, // 텍스트를 두껍게 설정
                    )),
                  ),
                  child: Text('취소'),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 35)),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                        0xFFF4F0C9)), // 배경색을 노란색으로 설정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.black, // 테두리 색상을 검은색으로 설정
                          width: 0.7, // 테두리 두께를 조절 (원하는 수치로 조절)
                        ),// 테두리 둥글기 설정 (원하는 수치로 조절)
                      ),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle( // 텍스트 스타일 지정
                      color: Colors.black, // 텍스트 색상을 검은색으로 설정
                      fontSize: 15, // 텍스트 크기를 조절 (원하는 수치로 조절)
                      fontWeight: FontWeight.w600, // 텍스트를 두껍게 설정
                    )),
                  ),
                  child: Text('회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
