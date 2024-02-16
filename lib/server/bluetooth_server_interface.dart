import 'dart:typed_data';

import 'package:flutter_bluetooth_flow/bluetooth_interface.dart';
import 'package:flutter_bluetooth_flow/server/events/bluetooth_server_platform_interface.dart';
import 'package:flutter_bluetooth_flow/server/methods/bluetooth_server_platform_interface.dart';

part 'bluetooth_server.dart';

abstract interface class BluetoothServerInterface extends BluetoothInterface {

  Future<void> initialize();

  Future<void> updateServerUUID(String uuidSeed);

  Future<void> startServer();

  Future<void> stopServer();
}
