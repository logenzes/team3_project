import 'package:flutter/material.dart';

// 별도의 창을 생성시 : stateless, statefull 결정
class MyScrollableWidget extends StatelessWidget {
  const MyScrollableWidget({super.key}); // 상위클래스와 일치 시키기 위해서 하는 행위!

  @override
  Widget build(BuildContext context){ // 그래픽 출력 (상위에서 ) 정보들을 BuildContext롤 주고받음
    //  DefaultTextStyle - wrapper widget    
    return DefaultTextStyle( // 하위 widget이 가져야하는 글꼴을 전체적으로 지정 -> 일괄지정하기 위해서
      // style: Theme.of(context).textTheme.bodyMedium,
      style: const TextStyle(fontSize: 36, color: Colors.blue),      
      child: LayoutBuilder( // 뷰포트 정보를 전달해 주는 위젯 
        builder:(BuildContext context, BoxConstraints viewportConstraints){ //화면 제약사항
          return SingleChildScrollView( // 스크롤 가능하게 하는 widget -> 여러객체에 대하여 스크롤링이 가능하도록 공통객체
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight
              ),
              child: Column( //세로로 여러개를 나열하겠다!
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,              
                children: <Widget>[
                  Container(
                    color : const Color(0xffeeee00), // Yellow
                    height: 520.0, //scrolling을 사용하기 위해서  사이즈를 크게줌 ! 
                    alignment: Alignment.center,
                    child: Column(
                      children:[
                        const Text("상위 콘테이너"),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('뒤로 돌아가기')
                        )
                      ]
                    ) 
                  ),
                  Container(
                    color: const Color(0xff008000), // green
                    height: 520.0,
                    alignment: Alignment.center,
                    child: const Text("하위 콘테이너"),
                  )
                ],
              )
            ),
          );
        },
      )
    );
  }
}

