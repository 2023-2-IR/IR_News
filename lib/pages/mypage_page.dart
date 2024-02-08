import 'package:flutter/material.dart';

class MypagePage extends StatefulWidget {
  const MypagePage({super.key});

  @override
  State<MypagePage> createState() => _MypagePageState();
}

class _MypagePageState extends State<MypagePage> {
  bool isSelected = false;
  List<InterestCategory> userCategories = [
    InterestCategory(name: '정치'),
    InterestCategory(name: '경제'),
    InterestCategory(name: '사회'),
    InterestCategory(name: '문화'),
    InterestCategory(name: '국제'),
    InterestCategory(name: '스포츠'),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.height;
    double deviceHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              /// 인사말
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.03 * deviceWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "정윤석 ",
                      style: TextStyle(
                        fontFamily: 'Noto Sans KR',
                        fontSize: 0.03 * deviceWidth,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.yellow,
                        decorationThickness: 2,
                      ),
                    ),
                    Text(
                      "님 안녕하세요.",
                      style: TextStyle(
                        fontFamily: 'Noto Sans KR',
                        fontSize: 0.02 * deviceWidth,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              /// 관심분야 (상단 제목)
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/categoryIcon.png',
                      width: 30,
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '관심 분야',
                        style: TextStyle(
                          fontSize: 0.02 * deviceWidth,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      height: 20,
                      thickness: 1,
                    ))
                  ],
                ),
              ),

              /// 관심분야 버튼
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 0.25 * deviceHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4 / 1,
                      mainAxisSpacing: 0.05 * deviceHeight,
                      crossAxisSpacing: 0.015 * deviceWidth,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: OutlinedButton(
                          onPressed: () {
                            // 클릭 시 추가할 내용.
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(isSelected ? Colors.yellow : Colors.white),
                          ),
                          child: Text(
                            '${userCategories[index].name}',
                            style: TextStyle(
                              fontSize: 0.016 * deviceWidth,
                              color: isSelected ? Colors.black : Colors.black,
                            ),
                            softWrap: false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// 기타 설정 (개인정보 라이센스, 수정, 탈퇴)
              Container(
                margin: EdgeInsets.only(top: 0.04 * deviceWidth),
                child: Column(
                  children: [
                    /// 개인정보 라이센스
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0.01 * deviceWidth),
                      child: InkWell(
                        onTap: () {
                          // 클릭 시 다른 페이지로 이동하는 코드
                          Navigator.pushNamed(context, '/license');
                        },
                        child: Ink(
                          padding: EdgeInsets.only(left: 0.01 * deviceWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),

                            border: Border(
                              bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                            ),
                          ),
                          child: Container(
                            height: 0.1 * deviceHeight,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/licenseIcon.png',
                                  width: 0.03 * deviceWidth,
                                  height: 0.03 * deviceWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.02 * deviceWidth),
                                  child: Text('개인정보 라이센스', style: TextStyle(
                                    fontSize: 0.02 * deviceWidth,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /// 개인정보 수정
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0.01 * deviceWidth),
                      child: InkWell(
                        onTap: () {
                          // 클릭 시 다른 페이지로 이동하는 코드
                          Navigator.pushNamed(context, '/license');
                        },
                        child: Ink(
                          padding: EdgeInsets.only(left: 0.01 * deviceWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            border: Border(
                              bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                            ),
                          ),
                          child: Container(
                            height: 0.1 * deviceHeight,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/reviseIcon.png',
                                  width: 0.03 * deviceWidth,
                                  height: 0.03 * deviceWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.02 * deviceWidth),
                                  child: Text('개인정보 수정', style: TextStyle(
                                    fontSize: 0.02 * deviceWidth,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /// 회원 탈퇴
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0.01 * deviceWidth),
                      child: InkWell(
                        onTap: () {
                          // 클릭 시 다른 페이지로 이동하는 코드
                          Navigator.pushNamed(context, '/license');
                        },
                        child: Ink(
                          padding: EdgeInsets.only(left: 0.01 * deviceWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            border: Border(
                              bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                            ),
                          ),
                          child: Container(
                            height: 0.1 * deviceHeight,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/deleteIcon.png',
                                  width: 0.03 * deviceWidth,
                                  height: 0.03 * deviceWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.02 * deviceWidth),
                                  child: Text('회원 탈퇴', style: TextStyle(
                                    fontSize: 0.02 * deviceWidth,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestCategory {
  final String name;
  bool isSelected;

  InterestCategory({required this.name, this.isSelected = false});
}
