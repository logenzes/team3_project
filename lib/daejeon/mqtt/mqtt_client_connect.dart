import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:get/get.dart';

// void _showDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: new Text("Alert!!"),
//         content: new Text("You are awesome!"),
//         actions: <Widget>[
//           new TextButton(
//             child: new Text("OK"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// void openDialog() {  
//   print('dialog');
//   Get.dialog(
//     AlertDialog(
//       title: const Text('test'),
//       content: const Text('test body'),
//       actions: [
//         TextButton(
//           child: const Text("Close"),
//           onPressed: () => Get.back(),
//         ),
//       ],
//     ),
//   );
// } 


Future<MqttClient> connect() async {
  MqttServerClient client = 
    MqttServerClient.withPort('34.64.247.73', 'ayWebSocketClient_123456_33f7423c-a3b7-46b1-8a1a-26937e4a071f', 19883);
  client.logging(on : true);
  client.onConnected = onConnected;
  
  client.onDisconnected =  onDisconnected;
  client.keepAlivePeriod = 20;
  // client.onUnsubscribed = onUnsubscribed;
  
  client.port = 19883;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;

  
  final connMess = MqttConnectMessage()
      .withClientIdentifier("ayWebSocketClient_123456_33f7423c-a3b7-46b1-8a1a-26937e4a071f")
      .authenticateAs("testadmin", "dipartenza24")
      // .keepAliveFor(60)
      .withWillTopic('willtopic')
      .withWillMessage("My Will message")
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMess;

  try {
    print('Connecting');
    await client.connect("testadmin", "dipartenza24");
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EMQX client connected');
    print("????????????");
    const topic = 'house/door';
    
    // client.subscribe(topic, MqttQos.atLeastOnce);
    client.subscribe('house/door', MqttQos.atLeastOnce);
    client.subscribe('house/camera', MqttQos.atLeastOnce);

    // client.update?.listen ??? callback ?????? ????????? ???.
    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      // final MqttMessage message = c[0].payload;
      // final payload = 
      //   MqttPublishPayload.bytesToStringAsString(message.toString()); //.payload.message;

      // print('Received message:$payload from topic: ${c[0].topic}>');
      
      // openDialog('updates');
      print('Received message: from topic: ${c[0].topic}>');
      
    });

    client.published?.listen((MqttPublishMessage message) {
      // print('published');
      // final payload =
      //     MqttPublishPayload.bytesToStringAsString(message.payload.message);
      // // openDialog();      
      // print(        
      //   'Published message: $payload to topic: ${message.variableHeader?.topicName}'
      // );
    });
  } else {
    print(
      'EMQX client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
    
  }
  return client;
}





void onMessage() { print('Message Arrived');}
void onConnected() {  print('Connected');}
void onDisconnected() { print('Disconneted');}
void onSubscribed(String topic) { print('subscribed topic: $topic');}
void onSubscribeFail(String topic) { print('Failed to subscribe: $topic');}
void onUnsubscribed(String topic) { print('Unsubscribed topic: $topic');}
void pong() { print('Ping response client callback invoked');}