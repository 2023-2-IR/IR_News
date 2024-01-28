import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_news/app_bar.dart';
import 'package:ir_news/pages/hashtag_page.dart';

class ArticlePage extends StatefulWidget {
  final dynamic id;

  const ArticlePage({Key? key, required this.id}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<Map<String, dynamic>> articleExampleData = [
    {
      "title": '4자녀 아빠 군인도 당직근무 면제된다…軍 "저출산 극복 동참"',
      "image":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/17/231b810d-afef-46c7-a575-8a0b4b235954.jpg",
      "time": "2024.01.24 12:00:00",
      "cont":
          "올해부터 군이 4자녀 이상을 둔 남성을 당직근무에서 면제시키기로 했다. \n기존에는 다자녀 여군이나 여성 군무원만 당직근무 면제 대상이었으나 이제는 남성 군인이나 군무원도 같은 대우를 받게 됐다. \n다자녀 여성(군인, 군무원)의 당직근무 면제는 기존과 동일하게 실시된다.",
      "key": "군면제",
      "isScrap": false,
      "category": "정치",
      "hashtag": ["저출산", "당직근무", "군인"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BaseAppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border(
                  bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                ),
              ),
              child: Column(
                children: [
                  /// 상단
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 5),
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        articleExampleData[0]["category"],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        articleExampleData[0]['time'],
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  /// 사진
                  Container(
                    height: 0.2 * deviceHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(articleExampleData[0]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// 제목
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 0.025 * deviceHeight),
                    child: Text(
                      articleExampleData[0]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// 내용
                  Text(
                    articleExampleData[0]['cont'],
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),

                  /// 해시태그, 북마크
                  Container(
                    height: 0.05 * deviceHeight,
                    margin:
                        EdgeInsets.symmetric(vertical: 0.025 * deviceHeight),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            itemCount: articleExampleData[0]["hashtag"].length,
                            itemBuilder: (context, index) {
                              final data = articleExampleData[0]["hashtag"];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => HashtagPage(hashtag: data[index]));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text("#",
                                          style: TextStyle(
                                            color: Color(0xFF1E5BF6),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Text(data[index]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              articleExampleData[0]['isScrap'] =
                                  !articleExampleData[0]['isScrap'];
                            });
                          },
                          child: Container(
                            child: Icon(
                              articleExampleData[0]["isScrap"] ? Icons.bookmark : Icons.bookmark_border,
                              color: Colors.yellow,
                              size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
