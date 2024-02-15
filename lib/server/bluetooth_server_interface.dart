import 'dart:typed_data';

import 'package:flutter_bluetooth_flow/server/events/bluetooth_server_platform_interface.dart';
import 'package:flutter_bluetooth_flow/server/methods/bluetooth_server_platform_interface.dart';

part 'bluetooth_server.dart';

abstract interface class BluetoothServerInterface {
  Stream<Uint8List> get messageStream;

  Stream<bool> get onConnected;

  Future<void> initialize();

  Future<void> updateServerUUID(String uuidSeed);

  Future<bool> isBluetoothEnabled();

  Future<void> startServer();

  Future<void> stopServer();

  Future<void> sendToClient(Uint8List message);

  Future<void> dispose();
}
