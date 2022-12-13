import 'package:flutter/material.dart';
import 'package:flutter_dev/detailview.dart';

class ListViewTest2 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListViewTest2> {
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
                return ListTile(
                  leading: const Icon(Icons.add),
                  title: Text('${names[index]} (${msgCount[index]})'),
                  trailing: Text('${msgCount[index]}'),
                  onTap: () {
                    var list1 = ListDetail(names[index], msgCount[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListDetailView(listDetail: list1))
                    );
                  },         
                );
              }
            )
          )
        ]
      )   
    );
  }
}