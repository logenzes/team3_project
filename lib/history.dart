import 'package:flutter/material.dart';
import 'package:flutter_dev/detailview.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class HistoryView extends StatefulWidget {
  @override
  _State createState() => _State();
}

var now = DateTime.now();

class _State extends State<HistoryView> {
  // final List<String> names = <String>['대한이', '민국이', '만세야', '고구려', '성공해', '편안히'];
  // final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4];
  final List<String> source = <String>['Door 1', 'Door 2', 'Door 1', 'Door 2', 'Door 1', 'Door 2'];
  final List<String> act = <String>['문 열림', '문 닫힘', '문 열림', '문 닫힘', '문 열림', '문 닫힘'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HISTORY'),
        
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: act.length,              
              itemBuilder: (BuildContext context, int index) {// 아이템빌더에서 하나의 규칙을 설정하면 다 만들어짐
                return ListTile(
                  // leading: const Icon(Icons.add),
                  title: Text('(${source[index]}) 에서 (${act[index]})이 감지되었습니다'),
                  trailing: Text('${DateFormat('h:mm:s a').format(DateTime.now())}'),
                  // onTap: () {
                  //   var list1 = ListDetail(names[index], msgCount[index]);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           ListDetailView(listDetail: list1))
                  //   );
                  // },         
                );                
              }
            )
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: const Text("받은 알림은 15일동안 보관됩니다"),
                  )         
        ]
      )   
    );
  }
}