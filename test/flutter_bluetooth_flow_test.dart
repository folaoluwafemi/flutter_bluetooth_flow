// import 'package:flutter_bluetooth_flow/flutter_bluetooth_flow_platform_interface.dart';

//
// final class MockFlutterBluetoothFlowPlatform
//     with MockPlatformInterfaceMixin
//     implements FlutterBluetoothFlowPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final FlutterBluetoothFlowPlatform initialPlatform =
//       FlutterBluetoothFlowPlatform.instance;
//
//   test('$MethodChannelFlutterBluetoothFlow is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterBluetoothFlow>());
//   });
//
//   test('getPlatformVersion', () async {
//     FlutterBluetoothFlow flutterBluetoothFlowPlugin = FlutterBluetoothFlow();
//     MockFlutterBluetoothFlowPlatform fakePlatform =
//         MockFlutterBluetoothFlowPlatform();
//     FlutterBluetoothFlowPlatform.instance = fakePlatform;
//
//     expect(await flutterBluetoothFlowPlugin.getPlatformVersion(), '42');
//   });
// }
