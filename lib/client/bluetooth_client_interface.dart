import 'dart:typed_data';

import 'package:flutter_bluetooth_flow/client/events/bluetooth_client_platform_interface.dart';
import 'package:flutter_bluetooth_flow/client/methods/bluetooth_client_platform_interface.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';
import 'package:flutter_bluetooth_flow/domain/model/scan_mode.dart';

part 'bluetooth_client.dart';

abstract interface class BluetoothClientInterface {
  Future<bool> isBluetoothEnabled();

  Future<void> send(Uint8List data);

  Future<void> disconnect();

  Future<void> connect(String deviceAddress);

  Future<List<BluetoothDevice>> fetchPairedDevices();

  Future<void> startScan();

  Future<void> stopScan();

  Future<void> dispose();

  Stream<BluetoothDevice> get onDeviceDiscovered;

  Stream<ScanMode> get onScanModeChanged;

  Stream<bool> get onConnected;

  Stream<Uint8List> get messageStream;
}
