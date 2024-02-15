import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';
import 'package:flutter_bluetooth_flow/domain/model/scan_mode.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_server_event_channel.dart';

abstract base class BluetoothClientPlatformInterface extends PlatformInterface {
  static final BluetoothClientPlatformInterface instance =
      BluetoothClientEventChannel();

  BluetoothClientPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  Stream<ScanMode> get onScanModeChanged;

  Stream<BluetoothDevice> get onScanDevice;

  Stream<Uint8List> get onDataReceived;

  Stream<bool> get onConnected;
}
