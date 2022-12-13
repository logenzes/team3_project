import 'package:charts_flutter/flutter.dart' as charts; // chart flutter 
import 'package:flutter/material.dart';

class OrdinalSales{
  final String year;
  final int sales;  

  OrdinalSales(this.year, this.sales);
}

class SimpleBarChart extends StatelessWidget{
  //default가 charts.Series<dynamic, dynamic>
  final List<charts.Series<OrdinalSales, String>> seriesList;
  // final List<charts.Series> seriesList;
  final bool animate;

  const SimpleBarChart(this.seriesList, {super.key, required this.animate});

  factory SimpleBarChart.withSampleData(){ //factory 생성자는 이름있는 생성자
    return SimpleBarChart( // 오리지널 생성자를 호출해서 객체를 생성
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context){
    // ignore: unnecessary_new
    return charts.BarChart(
      seriesList, //시리즈로 구성된 리스트가 전달!
      animate: animate,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(){
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];
    return [ //데이터를 chart 패키지가 우너하는 타입으로 지정해 주어야 함
      charts.Series<OrdinalSales, String>( // 차트 스리즈를 생성 : 데이터 객체가 먼저 지정
        id:'Sales',
        // 컬러, 도메인(범주), 값
        colorFn : (_,__) => charts.MaterialPalette.blue.shadeDefault,
        domainFn : (OrdinalSales sales, _) => sales.year, // 입력된 데이터중에 어떤 열이 도메인인가?
        measureFn : (OrdinalSales sales, _) => sales.sales,
        data :data,
      )
    ];
  }
}

//차트 감싸기 
class ChartWrapper extends StatelessWidget{
  const ChartWrapper({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          height: 550.0,
          alignment: Alignment.center,
          child: SimpleBarChart.withSampleData(),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("뒤로가기")
        )
      ],
    );
  }
}



