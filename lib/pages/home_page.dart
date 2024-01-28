import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              /// 검색 바 구현
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: '검색',
                        border: InputBorder.none,
                        icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(
                            Icons.search,
                            color: Colors.green,
                          ),
                        )),
                  ),
                ),
              ),

              /// 속보 뉴스
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    /// 상단 제목
                    Row(
                      children: [
                        Image.asset(
                          'assets/breakingIcon.png',
                          width: 30,
                          height: 40,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'BREAKING NEWS',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        Expanded(child: Divider(height: 20, thickness: 1 ,))
                      ],
                    ),

                    /// 속보 기사 (슬라이드)

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
