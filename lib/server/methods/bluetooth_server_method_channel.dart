part of 'bluetooth_server_platform_interface.dart';

final class BluetoothServerMethodChannel
    extends BluetoothServerMethodsInterface {
  final methodChannel = const MethodChannel(
    'com.dartgod/bluetooth_server_methods',
  );

  @override
  Future<void> initialize() async {
    try {
      const BluetoothServerMethod method = BluetoothServerMethod.initialize;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call initialize method. Error: $e';
    }
  }

  @override
  Future<void> updateServerUUID(String uuidSeed) async {
    try {
      const BluetoothServerMethod method =
          BluetoothServerMethod.updateServerUUID;
      await method.call(methodChannel, param: uuidSeed);
    } catch (e) {
      throw 'Unable to call updateServerUUID method. Error: $e';
    }
  }

  @override
  Future<bool> isBluetoothEnabled() async {
    try {
      const method = BluetoothServerMethod.isBluetoothEnabled;
      final bool? value = await method.call(methodChannel, param: null);
      return value ?? false;
    } catch (e) {
      throw 'Unable to call isBluetoothEnabled method. Error: $e';
    }
  }

  @override
  Future<void> startServer() async {
    try {
      const method = BluetoothServerMethod.startServer;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call startServer method. Error: $e';
    }
  }

  @override
  Future<void> stopServer() async {
    try {
      const method = BluetoothServerMethod.stopServer;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call stopServer method. Error: $e';
    }
  }

  @override
  Future<void> startAdvertising([int? secondDuration]) async {
    try {
      const method = BluetoothServerMethod.startAdvertising;
      await method.call(methodChannel, param: secondDuration);
    } catch (e) {
      throw 'Unable to call startAdvertising method. Error: $e';
    }
  }

  @override
  Future<void> send(Uint8List data) async {
    try {
      const method = BluetoothServerMethod.send;
      await method.call(methodChannel, param: data);
    } catch (e) {
      throw 'Unable to call send method. Error: $e';
    }
  }

  @override
  Future<void> dispose() async {
    try {
      const method = BluetoothServerMethod.dispose;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call dispose method. Error: $e';
    }
  }
}
