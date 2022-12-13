import 'package:flutter/material.dart';
// import 'package:flutter_dev/tabviewtest/navermap.dart';

// StatefulWidget으로 할 때 with AutomaticKeepAliveClientMixin<TabView>
// 탭을 이동할때 Widget이 이동하니까 전의 tab의 state가 초기화 됨
// Mixin을 사용하면 State를 저장해 주어서 항상 마지막 상태로 작업이 기능
class TabPage extends StatelessWidget {
  const TabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("tab test");
              },
              icon: Image.asset('assets/6172512.gif'),
            )
          ],
          bottom: TabBar(   //SilverAppBar : 탭 내용도 스크롤
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent,
              image: const DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fitWidth) ),
            tabs: const <Widget>[ // 여러개를 달아서 한번에 안보이면 scroll 사용하면 됨.
              Tab(icon: Icon(Icons.tag_faces)),
              Tab(text: '메뉴2'),
              Tab(icon: Icon(Icons.info), text: '메뉴3'),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Container(  // Widget을 채워서 정보를 표현 
            // child: const NaverMapTest()
            color: Colors.yellow,
          ),
          Container(
            // child: NaverMapTest(),
            color: Colors.orange,
          ),
          Container(
            color: Colors.red,
          ),
        ],
        )
      ),
    );
  }
}