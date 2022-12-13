import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchPage  extends StatefulWidget {
  const StopWatchPage({super.key});
  
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

// StatefulWidget 새롭게 화면을 그릴때 사용
class _StopWatchPageState extends State<StopWatchPage> {
  late Timer _timer;    // 시간을 tick으로 구동하는 객체
  var _time = 0;
  var _isRunning = false;
  final List<String> _lapTimes = [];

  @override
  void dispose() {
    _timer.cancel();  // 중지 - 시스템 객체
    super.dispose();
  }

  Widget build(BuildContext context) {  // 상위 화면에 대한 정보
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: _buildBody(),   // 함수전달이 아니고 함수 실행 결과가 넘어옴.
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.5,),
      ),
      //이벤트는 함수와 연결, 보통인 경우는 객체, Enum 변수(범주형, 선택)와 연결
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {  //onPressed에 넘어오는 것은 함수의 주소
          _clickButton();
        }),
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ); 
  }

  Widget _buildBody() {
    var sec = _time ~/ 100;   // 정수 나눗셈
    var hundredth = '${_time % 100}'.padLeft(2, '0');   // 밀리세컨드를 100단위로 표현
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$sec',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('$hundredth'),
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  child: ListView(
                    // map 은 함수형 프로그래밍
                    children: _lapTimes.map((time) => Text(time)).toList(),
                  ),
                ),
              ],
            ),
            Positioned(   // 지정된 위치에 버튼 추가
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: _reset,  // 함수의 이름만 전달(연결)
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {   // onPressed에 연결되는 것 : 매개변수가 없는 무명함수
                  setState(() {   // 여기서 정의된 함수의 주소가 onPressed로 연결됨.(함수가 함수를 매개변수로 전달)
                    _recordLapTime('$sec.$hundredth');    // 리스트에 시간을 현재 시간을 추가
                  });
                },
                child: Text('랩타임'),
              ),
            )
          ],),
      ),
    );
  }

  void _clickButton() {
    _isRunning = !_isRunning;   // 반대로 지정(on/off)
    if (_isRunning) {   // true
      _start();       // 시계 작동
    } else {          // false
      _pause();       // 멈춤
    }
  }
  void _start() {   //  1/1000초   ,   1/100초마다 신호 발생 : tick이 발생
    // periodic(Duration) 주기적으로 신호를 발생
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() { // 초당 100번 실행
        _time++;    // 화면을 갱신
      });
    });
  }
  void _pause() {
    _timer.cancel();
    }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer.cancel();        // 중지
      _lapTimes.clear();      // 리스트가 삭제
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, "${_lapTimes.length + 1}등 $time");
  }
}