import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_flow/server/methods/bluetooth_server_methods.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'bluetooth_server_method_channel.dart';
part 'explicit_bluetooth_server_method_channel.dart';

abstract base class BluetoothServerPlatformInterface extends PlatformInterface {
  /// Constructs a BluetoothServerPlatformInterface.
  BluetoothServerPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static BluetoothServerPlatformInterface _instance =
      BluetoothServerMethodChannel();

  static BluetoothServerPlatformInterface get instance => _instance;

  static set instance(BluetoothServerPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize() {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> updateServerUUID(String uuidSeed) {
    throw UnimplementedError('updateServerUUID() has not been implemented.');
  }

  Future<bool> isBluetoothEnabled() {
    throw UnimplementedError('isBluetoothEnabled() has not been implemented.');
  }

  Future<void> startServer() {
    throw UnimplementedError('startServer() has not been implemented.');
  }

  Future<void> stopServer() {
    throw UnimplementedError('stopServer() has not been implemented.');
  }

  Future<void> send(Uint8List data) {
    throw UnimplementedError('send() has not been implemented.');
  }

  Future<void> dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
