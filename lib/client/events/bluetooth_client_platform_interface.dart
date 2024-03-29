import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';
import 'package:flutter_bluetooth_flow/domain/model/scan_mode.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_client_event_channel.dart';

abstract base class BluetoothClientEventInterface extends PlatformInterface {
  static final BluetoothClientEventInterface instance =
      BluetoothClientEventChannel();

  BluetoothClientEventInterface() : super(token: _token);

  static final Object _token = Object();

  Stream<ScanMode> get onScanModeChanged;

  Stream<BluetoothDevice> get onScanDevice;

  Stream<Uint8List> get onDataReceived;

  Stream<bool> get onConnected;
}
