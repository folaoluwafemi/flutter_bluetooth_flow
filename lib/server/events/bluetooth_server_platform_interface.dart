import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_server_event_channel.dart';

abstract base class BluetoothServerPlatformInterface extends PlatformInterface {
  static BluetoothServerPlatformInterface _instance =
      BluetoothServerEventChannel();

  BluetoothServerPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static BluetoothServerPlatformInterface get instance => _instance;

  static set instance(BluetoothServerPlatformInterface instance) {
    _instance = instance;
  }

  Stream<Uint8List> get onDataReceived;

  Stream<bool> get onConnected;
}
