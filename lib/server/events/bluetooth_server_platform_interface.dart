import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_server_event_channel.dart';

abstract base class BluetoothServerEventInterface extends PlatformInterface {
  static BluetoothServerEventInterface _instance =
      BluetoothServerEventChannel();

  BluetoothServerEventInterface() : super(token: _token);

  static final Object _token = Object();

  static BluetoothServerEventInterface get instance => _instance;

  static set instance(BluetoothServerEventInterface instance) {
    _instance = instance;
  }

  Stream<Uint8List> get onDataReceived;

  Stream<bool> get onConnected;
}
