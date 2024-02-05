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
      appBar: AppBar( title: Text('This is my design', style: TextStyle(fontWeight: FontWeight.w900),)),
      body: Container(
        height: 150,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset('hannibal.jpg', width: 300,),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('남편 팝니다', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text('볼티모어 근처, 울프트랩 가능', style: TextStyle(fontSize: 15)),
                  Text('무료 나눔', style: TextStyle(fontSize: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite, color: Colors.red,),
                      Text('4'),
                    ],
                  ),
                ],
              ),
            )
          ],
            ),
          )
        ),
      );

  }
}
