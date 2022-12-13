import 'package:flutter/material.dart';
// import 'package:flutter_dev/ListViewTest.dart'; // 단독으로만 볼때 사용
import 'package:flutter_dev/ListViewTest2.dart';

import 'package:flutter_dev/scrollingtest.dart';
import 'package:flutter_dev/daejeon/chart_flutter_test.dart';
import 'package:flutter_dev/daejeon/pageviewtest.dart';
import 'package:flutter_dev/daejeon/textfiled_listview.dart';
import 'package:flutter_dev/daejeon/mqtt/mqtt_client_widget.dart';
import 'package:flutter_dev/daejeon/timertest.dart';
import 'package:flutter_dev/daejeon/imageanimation.dart';
import 'package:flutter_dev/gameplay.dart';
// import 'package:flutter_dev/tabviewtest/navermap.dart';
import 'package:flutter_dev/tabviewtest/tabviewtest.dart';
import 'package:flutter_dev/history.dart';
import 'package:flutter_dev/daejeon/weather/loading_screen.dart';
import 'package:flutter_dev/daejeon/weather.dart';



// Material design
// flutter는 dart기반의 window 프로그래밍

void main() {
  runApp(const MyApp()); //MyApp을 인스턴스해서 전달
  // final person = Person("이창혁", 34);
  // runApp(SecondPage(person: person));
}

class MyApp extends StatelessWidget {
  // 인터페이스는 StatelessWidget, StatefulWidget 둘 중에 하나로 생성
  const MyApp({super.key}); // 생성자 호출 : StatelessWidget의 키를 전달

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 화면에 출력 : BuildContext 시스템에서 전달되는 객체
    return MaterialApp(
      // routes: {
      //   '/detailview':(context) => ListDetailView(), // Navigator.pushNamed(context, '경로')
      //   '/loginview' :(context) => LoginView(),
      // },
      // 디자인을 선택한 것을 리턴
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // state를 가지고 있음
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  
  

  final String title;

  @override // 제정의해 놓으면 lifecycle에 의해서 자동으로 호출됨
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  //State 클래스를 상속받음
  int _counter = 0; // 상태 변수

  void _incrementCounter() {
    setState(() {
      // setState함수가 화면을 다시 그려줌
      // 값을 변경
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // 화면에서 가벽(Widget을 품고 있는 하나의 바운더리)
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title), //this // 부모를 widget으로 지정
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        // Center 위치를 나타내는 위젯
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.count(
          crossAxisCount: 5,              // 한 열에 들어 가는 갯수
          childAspectRatio: 1 / 1.2,      // 가로 세로
          crossAxisSpacing: 4.0,        //
          mainAxisSpacing: 8.0,
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          // mainAxisAlignment: MainAxisAlignment.center, //정렬에 대한 키
          children: <Widget>[
            // 리스트에 있는 객체는 다 위젯이다!
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text("다음페이지"),
              onPressed: () async {
                final person = Person("이창혁", 34);
                final result = await Navigator.push(
                    // Stack 복귀 주소를 저장 라우트에 지정된 주소로 이전
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(person: person)));
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCustomForm()));
              },
              child: const Text('텍스트입력')
            ),
            ElevatedButton(              
              child: const Text("성적확인"),
              onPressed: (){
                final student = Student("노력파", 100, 90, 95); //디비접속, 로컬 db에서 데이터 로딩
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  StudentPage(student: student)
                  )
                );
              },              
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewTest2()));
              },
              child: const Text("리스트뷰 출력")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyScrollableWidget()));
              },
              child: const Text("스크롤뷰 출력")
            ),
            ElevatedButton(
              onPressed: (){                                           
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChartWrapper()));
              },
              child: const Text("차트뷰 출력")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageViewTest()));
              },
              child: const Text("페이지뷰")
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DataManager()));
              },
              child: const Text("데이터 입출력"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMqttPage(title:'MQTT 통신')));
              },
              child: const Text("MQTT 통신"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StopWatchPage()));
              },
              child: const Text("타이머테스트"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedContainerPage()));
              },
              child: const Text("이미지출력"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const GamePlayPage()));
              },
              child: const Text("dino 게임"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TabPage()));
              },
              child: const Text("TabBar"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryView()));
              },
              child: const Text("History"),
            ),
            ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text("Alert Dialog"),
            ),
            ElevatedButton(
              onPressed:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Weather()));
              },
              child: const Text("Weather"),
            ),
            // ElevatedButton(
            //   onPressed:  (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> NaverMapTest()));
            //   },
            //   child: const Text("NaverMap"),
            // ),
            // Container(color: Colors.green,
            //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            //   child: Container(
            //     color: Colors.yellow,
            //     child: Text('텍스트'),)
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //body와 동격
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
          color: Colors.orangeAccent,
          child: SizedBox(
            height: 100.0,
            // ignore: sort_child_properties_last
            child: Row(children: <Widget>[
              const Text("   융합학원"),
              const Text("   대전시청   "),
              const Icon(Icons.home),
              IconButton(
                icon: const Icon(Icons.add_box),
                onPressed: () {
                  debugPrint("테스트입니다.");
                },
              ),
            ]),
          )),
      persistentFooterButtons: const <Widget>[
        IconButton(onPressed: null, icon: Icon(Icons.account_box)),
        IconButton(onPressed: null, icon: Icon(Icons.account_circle))
      ],
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// dynamic, var, final, const 를 반드시 사용하자 -> null safety에 도움이 된다
class SecondPage extends StatelessWidget {
  final Person person;
  const SecondPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
        appBar: AppBar(
          title: Text(person.name),
        ),
        body: ElevatedButton(
          child: const Text('이전 페이지로'),
          onPressed: () {
            Navigator.pop(context, 'ok');
          },
        ));
  }
}

// class TextFieldTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Retrive Text Input",
//       home: MyCustomForm(),
//     );
//   }
// }

class MyCustomForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController(); //콘트롤을 사용하는 문제로 dispose 필요
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose(); //반드시 해제 시켜야 함
    super.dispose();
  }

  void _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // 두개의 textfiled를 일치시키기 위해
            TextField(
              //텍스트 입력 widget
              style: const TextStyle(fontSize: 18),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                hintText: "메일주소를 입력하세요"
              ),
              onChanged: (text) {
                //변화가 일어나면 _printLatestValue
                //이벤트
                print("First text filed: $text");
              },
            ),
            TextField(
              controller: myController, //콘트롤러
            )
          ],
        )
      )
    );
  }
}

//새로운 페이지를 만들고 메인에서 넘어오는 1인분의 이름 국어 영어 수학 점수를 받아서
//합계를 계산하고 이림과 합계를 출력하는 새로운 페이지를 만들고 다시 메인으로 복귀하도록 프로그램을 작성하시요.

class Student {
  String name;
  var kor;
  var mat;
  var eng;  

  Student(this.name, this.kor, this.mat, this.eng);
}

class StudentPage extends StatelessWidget { //경고창을 제외하고 별도로 창을 구성
  final Student student;
  const StudentPage({Key? key, required this.student}) : super(key: key); //상세뷰

  @override
  Widget build(BuildContext context) {
    debugPrint("StudentPage build()");
    return Scaffold( // 가벽(4가지 영역)
      appBar: AppBar(
        title: const Text("성적 확인"),
      ),
      body: Center( //위치제어도 위젯
        child : Column( //어떻게 배치할 것인지 위젯으로
          mainAxisAlignment: MainAxisAlignment.center, //enum변수 : 변주형 변수다
          children: <Widget>[
            Text("이름 : ${student.name}"), // 클래스 속성을 외부에서 참조할 때 ${}
            Text("국어 : ${student.kor.toString()}"),
            Text("영어 : ${student.eng.toString()}"),
            Text("수학 : ${student.mat.toString()}"),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'ok');
              },
              child: const Text('이전 페이지로')
            )
          ],
        )
      )
    );
  }
}

// 문제 list있는 데이터 짝 한개를 넘겨서 출력하는 클래스를 만들고 메인에서 호출하면서 값을 넘겨 
class ListDetail{
  String name;
  int msgCount;
  
  ListDetail(this.name, this.msgCount);
}
class ListDetailView extends StatelessWidget{
  final ListDetail listDetail;
  const ListDetailView({Key? key, required this.listDetail }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : const Text("상세화면")
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("이름 : ${listDetail.name}"),
            Text("메세지 카운트 : ${listDetail.msgCount}"),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'ok');
              },
              child: const Text('이전 페이지로'),
            )
          ],
        ),
      )
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alert!!"),
        content: new Text("You are awesome!"),
        actions: <Widget>[
          new TextButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

