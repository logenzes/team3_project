import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListViewTest> {
  final List<String> names = <String>['대한이', '민국이', '만세야', '고구려', '성공해', '편안히'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리스트뷰 데이터 출력'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {// 아이템빌더에서 하나의 규칙을 설정하면 다 만들어짐
                return Container(
                  height: 50,
                  margin: const EdgeInsets.all(2),
                  color: msgCount[index]>=10? Colors.blue[400]: // 3항 연산자
                    msgCount[index]>3? Colors.blue[100]: Colors.grey,
                  child: Center(    // 출력내용을 텍스트로 표현
                    child: Text('${names[index]} (${msgCount[index]})',
                      style: const TextStyle(fontSize: 18),
                    ),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>ListDetailView()));}
                  ),
                );
              }
            )
            ,
          )
      ]
      )   
    );
  }
}