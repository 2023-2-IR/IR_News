import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_news/pages/article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> exampleData = [
    {
      "title": "[속보] 넷플릭스, 티빙, 쿠팡플레이도?.. 영화처럼 'OTT 부담금' 검토",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/a8bc671c-1deb-4e6d-9654-a9d7b4a3aa9e.jpg",
      "time": "2024-01-24 12:00:00",
      "id": 13,
    },
    {
      "title": "[속보] 한동훈 '운동권에 죄송한 마음 없지만, 청년엔 너무 죄송하다'",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/779d2272-3841-4fad-8587-e0f25f14462e.jpg",
      "time": "2024-01-24 13:30:00",
      "id": 14,
    },
    {
      "title": '[속보] 2연승으로 "대세론" 굳힌 트럼프... WP "경선 사실상 끝났다."',
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/83111cb2-0e06-44fe-ae6f-13d61d9ca11d.jpg",
      "time": "2024-01-24 15:45:00",
      "id": 15,
    },
    // 필요에 따라 추가 데이터를 넣어주세요.
  ];

  final List<Map<String, dynamic>> hotExampleData = [
    {
      "title": "제주서 발생한 떼까마귀 집단 폐사 원인은?",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/a8bc671c-1deb-4e6d-9654-a9d7b4a3aa9e.jpg",
      "category": "사회",
      "id": 16,
    },
    {
      "title": "'나만 돈 없나?' 50대 가장의 평균 저축액 얼마길래",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "category": "경제",
      "id": 17,
    },
    {
      "title": '현대車, 이젠 하늘길도 연다... 전기 수직 이착륙 항공기 첫 공개',
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/10/8337be36-18de-4617-a8bf-cb583065223b.jpg",
      "category": "사회",
      "id": 18,
    },
    {
      "title": "무인카페에 얼음 쏟고 간 초등학생, 다시 와서 남긴 ‘1000원' 한장",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/10/490859fd-73e2-4541-b918-12b8c9a94de9.jpg",
      "category": "사회",
      "id": 19,
    },
    {
      "title": "'나만 돈 없나?' 50대 가장의 평균 저축액 얼마길래",
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "category": "경제",
      "id": 20,
    },
    {
      "title": '현대車, 이젠 하늘길도 연다... 전기 수직 이착륙 항공기 첫 공개',
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/10/8337be36-18de-4617-a8bf-cb583065223b.jpg",
      "category": "사회",
      "id": 21,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                /// 검색 바 구현
                Container(
                  height: 35,
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
                          contentPadding: EdgeInsets.only(bottom: 11),
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
                  margin: EdgeInsets.only(top: 10,bottom: 5),
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
                          Expanded(
                              child: Divider(
                            height: 20,
                            thickness: 1,
                          ))
                        ],
                      ),

                      /// 속보 기사 (슬라이드)
                      Container(
                        padding: EdgeInsets.only(bottom: 0.015 * deviceHeight),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border(
                            bottom:
                                BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                          ),
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 0.21 * deviceHeight,
                            aspectRatio: 3 / 2,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                          ),
                          items: exampleData.map((data) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ArticlePage(
                                          id: data['id'],
                                        ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(data['image']),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.005 * deviceHeight,
                                            horizontal: 0.05 * deviceWidth),
                                        height: 0.05 * deviceHeight,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD9D9D9)
                                              .withOpacity(0.9),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          data['title'],
                                          style: TextStyle(
                                            fontSize: 0.03 * deviceWidth,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),

                      /// hot 상단
                      Container(
                        margin:
                            EdgeInsets.only(top: 0.03 * deviceHeight),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/hotIcon.png',
                              width: 17,
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "TODAY'S HOT TOPIC",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
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

                      /// 핫토픽 기사.
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border(
                            bottom:
                            BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                          ),
                        ),
                        child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: hotExampleData.length,
                          itemBuilder: (context, index) {
                            final data = hotExampleData[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ArticlePage(
                                      id: data['id'],
                                    ));
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['category'],
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.yellow,
                                              decorationThickness: 3,
                                            ),
                                          ),
                                          Text(
                                            data['title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Noto Sans KR',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 0.01 * deviceWidth),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 0.07 * deviceHeight,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.01 * deviceHeight),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(data['image']),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
