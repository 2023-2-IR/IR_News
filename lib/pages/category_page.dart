import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final userCategories = ['정치', '경제', '사회', '문화', '연예', '스포츠', 'IT', '기타'];
  String selectedCategory = '경제'; // 변경: null이 허용되지 않는 String으로 변경

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.height;
    double deviceHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          '항목 선택',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: userCategories
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedCategory,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 110,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.only(left: 30),
                          height: 40,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
