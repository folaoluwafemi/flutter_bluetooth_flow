import 'dart:typed_data';

import 'package:flutter_bluetooth_flow/bluetooth_interface.dart';
import 'package:flutter_bluetooth_flow/client/events/bluetooth_client_platform_interface.dart';
import 'package:flutter_bluetooth_flow/client/methods/bluetooth_client_platform_interface.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';
import 'package:flutter_bluetooth_flow/domain/model/scan_mode.dart';

part 'bluetooth_client.dart';

abstract interface class BluetoothClientInterface
    implements BluetoothInterface {
  Future<void> disconnect();

  Future<void> connect(String deviceAddress);

  Future<List<BluetoothDevice>> fetchPairedDevices();

  Future<void> startScan();

  Future<void> stopScan();

  Stream<BluetoothDevice> get onDeviceDiscovered;

  Stream<ScanMode> get onScanModeChanged;
}
