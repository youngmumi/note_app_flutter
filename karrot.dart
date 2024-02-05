//당근마켓 코딩

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('This is my design', style: TextStyle(fontWeight: FontWeight.w900),)),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              buildRow('hannibal.jpg', '남편 팝니다', '글쓴이: sweet william', '볼티모어 근처, 울프트랩 가능', '무료 나눔', Colors.red, '52'),
              buildRow('hannibal_solve.jpg', '아닙니다 저희끼리 해결했습니다', '글쓴이: sweet william', '삭제됨', '삭제됨', Colors.black12, '0'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String image, String title, String author, String location, String status, Color iconColor, String likes) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text(author, style: TextStyle(fontSize: 15, color: Colors.black45)),
                Text(location, style: TextStyle(fontSize: 15, color: Colors.black45)),
                Text(status, style: TextStyle(fontSize: 15, color: Colors.black45)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite, color: iconColor),
                    Text(likes),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
