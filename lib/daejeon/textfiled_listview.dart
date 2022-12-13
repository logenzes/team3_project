import 'dart:io';
import 'package:flutter/material.dart';

class DataManager extends StatefulWidget{
  @override
  DataManagerState createState() => DataManagerState();
}

class DataManagerState extends State <DataManager>{
  //하부의 데이터만 데이터베이스와 연결하면 된다.
  final List<String> names = <String>['대한이', '민국이', '만세야'];
  final List<int> msgCount = <int>[2, 0 ,10];
  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0, nameController.text);
      msgCount.insert(0, 0);
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('리스트에 데이터 추가'),
      ),
      body: Column(
        children: <Widget> [
          Padding(
            padding : const EdgeInsets.all(20),
            child : TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Name'
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              addItemToList();
            },
            child: const Text("Add")
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  margin: const EdgeInsets.all(2),
                  color: msgCount[index]>=10 ? Colors.blue : msgCount[index]>3 ? Colors.blue[100] : Colors.grey,
                  child: Center(
                    child: Text(
                      '${names[index]} (${msgCount[index]})',
                      style: const TextStyle(fontSize: 18),
                    )
                  ),
                );
              }
            ),
          )
        ],
      )
    );
  }
}