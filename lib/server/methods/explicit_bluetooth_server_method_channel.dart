part of 'bluetooth_server_platform_interface.dart';

final class ExplicitBluetoothServerMethodChannel
    extends BluetoothServerPlatformInterface {
  final methodChannel = const MethodChannel(
    'com.dartgod/bluetooth_server_methods',
  );

  @override
  Future<void> initialize() async {
    try {
      await methodChannel.invokeMethod(BluetoothServerMethods.initialize);
    } catch (e) {
      throw 'Unable to call initialize method. Error: $e';
    }
  }

  @override
  Future<void> updateServerUUID(String uuidSeed) async {
    try {
      await methodChannel.invokeMethod(
        BluetoothServerMethods.updateServerUUID,
        <String, dynamic>{'uuidSeed': uuidSeed},
      );
    } catch (e) {
      throw 'Unable to call updateServerUUID method. Error: $e';
    }
  }

  @override
  Future<bool> isBluetoothEnabled() async {
    try {
      final bool? value = await methodChannel.invokeMethod(
        BluetoothServerMethods.isBluetoothEnabled,
      );

      return value ?? false;
    } catch (e) {
      throw 'Unable to call isBluetoothEnabled method. Error: $e';
    }
  }

  @override
  Future<void> startServer() async {
    try {
      await methodChannel.invokeMethod(
        BluetoothServerMethods.startServer,
      );
    } catch (e) {
      throw 'Unable to call startServer method. Error: $e';
    }
  }

  @override
  Future<void> stopServer() async {
    try {
      await methodChannel.invokeMethod(
        BluetoothServerMethods.stopServer,
      );
    } catch (e) {
      throw 'Unable to call stopServer method. Error: $e';
    }
  }

  @override
  Future<void> send(Uint8List data) async {
    try {
      await methodChannel.invokeMethod(
        BluetoothServerMethods.send,
        <String, dynamic>{'data': data},
      );
    } catch (e) {
      throw 'Unable to call send method. Error: $e';
    }
  }

  @override
  Future<void> dispose() async {
    try {
      await methodChannel.invokeMethod(
        BluetoothServerMethods.dispose,
      );
    } catch (e) {
      throw 'Unable to call dispose method. Error: $e';
    }
  }
}
