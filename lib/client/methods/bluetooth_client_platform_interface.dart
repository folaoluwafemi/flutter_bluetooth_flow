import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_flow/client/methods/bluetooth_client_methods.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_client_method_channel.dart';

part 'enum_enhanced_client_method_channel.dart';

abstract base class BluetoothClientMethodsInterface extends PlatformInterface {
  /// Constructs a BluetoothClientPlatformInterface.
  BluetoothClientMethodsInterface() : super(token: _token);

  static final Object _token = Object();

  static BluetoothClientMethodsInterface _instance =
      BluetoothClientMethodChannel();

  static BluetoothClientMethodsInterface get instance => _instance;

  static set instance(BluetoothClientMethodsInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isBluetoothEnabled() {
    throw UnimplementedError('isBluetoothEnabled() has not been implemented.');
  }

  Future<void> send(Uint8List data) {
    throw UnimplementedError('send() has not been implemented.');
  }

  Future<void> disconnect() {
    throw UnimplementedError('disconnect() has not been implemented.');
  }

  Future<void> connect(String deviceAddress) {
    throw UnimplementedError('connect() has not been implemented.');
  }

  Future<List<BluetoothDevice>> fetchPairedDevices() {
    throw UnimplementedError('fetchPairedDevices() has not been implemented.');
  }

  Future<void> startScan() {
    throw UnimplementedError('updateClientUUID() has not been implemented.');
  }

  Future<void> stopScan() {
    throw UnimplementedError('stopScan() has not been implemented.');
  }

  Future<void> dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
