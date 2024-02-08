import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_news/app_bar.dart';
import 'package:ir_news/pages/article_page.dart';

class HashtagPage extends StatefulWidget {
  final dynamic hashtag;

  const HashtagPage({Key? key, required this.hashtag}) : super(key: key);

  @override
  State<HashtagPage> createState() => _HashtagPageState();
}

class _HashtagPageState extends State<HashtagPage> {
  final List<Map<String, dynamic>> scrapExampleData = [
    {
      "title": "'북러 무기거래' 나진항서 또 대형 선박 포착, 탄도 미사일 거래 주목",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/779d2272-3841-4fad-8587-e0f25f14462e.jpg",
      "cont":
      "북한과 러시아의 무기 거래 현장으로 지목된 나진항에 대형 선박이 입출항 하는 장면이 계속 포착되고 있다고 미국의 소리 (VOA)가 10일 보도했다.",
      "id": 1,
    },
    {
      "title": "김정은 '대한민국은 주적... 기회 온다면 초토화할 것'",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "cont":
      "김정은 북한 국무위원장이 남한을 ‘주적’으로 규정하여 “조선반도에서 압도적 힘에 의한 대사변을 일방적으로 결정하지는 않겠지만 전쟁을 피할 생각 또한 전혀 없다”고 밝혔다.",
      "id": 2,
    },
    {
      "title": "'북러 무기거래' 나진항서 또 대형 선박 포착, 탄도 미사일 거래 주목",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/83111cb2-0e06-44fe-ae6f-13d61d9ca11d.jpg",
      "cont":
      "북한과 러시아의 무기 거래 현장으로 지목된 나진항에 대형 선박이 입출항 하는 장면이 계속 포착되고 있다고 미국의 소리 (VOA)가 10일 보도했다.",
      "id": 3,
    },
    {
      "title": "김정은 '대한민국은 주적... 기회 온다면 초토화할 것'",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "cont":
      "김정은 북한 국무위원장이 남한을 ‘주적’으로 규정하여 “조선반도에서 압도적 힘에 의한 대사변을 일방적으로 결정하지는 않겠지만 전쟁을 피할 생각 또한 전혀 없다”고 밝혔다.",
      "id": 4,
    },
    {
      "title": "'북러 무기거래' 나진항서 또 대형 선박 포착, 탄도 미사일 거래 주목",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/a8bc671c-1deb-4e6d-9654-a9d7b4a3aa9e.jpg",
      "cont":
      "북한과 러시아의 무기 거래 현장으로 지목된 나진항에 대형 선박이 입출항 하는 장면이 계속 포착되고 있다고 미국의 소리 (VOA)가 10일 보도했다.",
      "id": 5,
    },
    {
      "title": "김정은 '대한민국은 주적... 기회 온다면 초토화할 것'",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "cont":
      "김정은 북한 국무위원장이 남한을 ‘주적’으로 규정하여 “조선반도에서 압도적 힘에 의한 대사변을 일방적으로 결정하지는 않겠지만 전쟁을 피할 생각 또한 전혀 없다”고 밝혔다.",
      "id": 6,
    },
    {
      "title": "'북러 무기거래' 나진항서 또 대형 선박 포착, 탄도 미사일 거래 주목",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/a8bc671c-1deb-4e6d-9654-a9d7b4a3aa9e.jpg",
      "cont":
      "북한과 러시아의 무기 거래 현장으로 지목된 나진항에 대형 선박이 입출항 하는 장면이 계속 포착되고 있다고 미국의 소리 (VOA)가 10일 보도했다.",
      "id": 7,
    },
    {
      "title": "김정은 '대한민국은 주적... 기회 온다면 초토화할 것'",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "cont":
      "김정은 북한 국무위원장이 남한을 ‘주적’으로 규정하여 “조선반도에서 압도적 힘에 의한 대사변을 일방적으로 결정하지는 않겠지만 전쟁을 피할 생각 또한 전혀 없다”고 밝혔다.",
      "id": 8,
    },
    {
      "title": "'북러 무기거래' 나진항서 또 대형 선박 포착, 탄도 미사일 거래 주목",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202401/24/a8bc671c-1deb-4e6d-9654-a9d7b4a3aa9e.jpg",
      "cont":
      "북한과 러시아의 무기 거래 현장으로 지목된 나진항에 대형 선박이 입출항 하는 장면이 계속 포착되고 있다고 미국의 소리 (VOA)가 10일 보도했다.",
      "id": 9,
    },
    {
      "title": "김정은 '대한민국은 주적... 기회 온다면 초토화할 것'",
      "image":
      "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202012/17/e28e4bc8-c790-4056-8168-fea10d4c42c5.jpg",
      "cont":
      "김정은 북한 국무위원장이 남한을 ‘주적’으로 규정하여 “조선반도에서 압도적 힘에 의한 대사변을 일방적으로 결정하지는 않겠지만 전쟁을 피할 생각 또한 전혀 없다”고 밝혔다.",
      "id": 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    /// 상단 메뉴
                    Text("#", style: TextStyle(
                      fontSize: deviceWidth * 0.06,
                      color: Color(0xFF1E5BF6),
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.hashtag, style: TextStyle(
                        fontSize: deviceWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                    Expanded(
                        child: Divider(
                          height: 20,
                          thickness: 1,
                        )),
                  ],
                ),
                /// 기사
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xFF9D9C9C)),
                    ),
                  ),
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: scrapExampleData.length,
                    itemBuilder: (context, index) {
                      final data = scrapExampleData[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ArticlePage(
                            id: data['id'],
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.005 * deviceHeight),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 0.085 * deviceHeight,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.01 * deviceHeight),
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
                              ),
                              SizedBox(width: 0.04 * deviceWidth),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Noto Sans KR',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 0.005 * deviceHeight),
                                    Text(
                                      data['cont'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Noto Sans KR',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
