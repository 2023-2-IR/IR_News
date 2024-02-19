import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_news/app_bar.dart';
import 'package:ir_news/pages/home_page.dart';
import 'package:ir_news/pages/category_page.dart';
import 'package:ir_news/pages/login_page.dart';
import 'package:ir_news/pages/scrap_page.dart';
import 'package:ir_news/pages/mypage_page.dart';
import 'package:ir_news/pages/license_page.dart' as UserLicensePage;
import 'package:ir_news/pages/signup_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NARA',
      debugShowCheckedModeBanner: false, // 디버그 라벨 제거
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, // 기본 색상
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/license': (context) => UserLicensePage.LicensePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final List<Widget> _pages = [ScrapPage(), HomePage(), CategoryPage(), MypagePage()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '스크랩',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 252, 220, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}