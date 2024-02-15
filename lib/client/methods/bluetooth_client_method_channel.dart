part of 'bluetooth_client_platform_interface.dart';

final class BluetoothClientMethodChannel
    extends BluetoothClientPlatformInterface {
  final methodChannel = const MethodChannel(
    'com.dartgod/bluetooth_client_methods',
  );

  @override
  Future<bool> isBluetoothEnabled() async {
    try {
      final bool? value = await methodChannel.invokeMethod<bool>(
        BluetoothClientMethods.isBluetoothEnabled,
      );
      return value ?? false;
    } catch (e) {
      throw 'Unable to call isBluetoothEnabled method. Error: $e';
    }
  }

  @override
  Future<void> send(Uint8List data) async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.send,
        <String, dynamic>{'data': data},
      );
    } catch (e) {
      throw 'Unable to call send method. Error: $e';
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.disconnect,
      );
    } catch (e) {
      throw 'Unable to call disconnect method. Error: $e';
    }
  }

  @override
  Future<void> connect(String deviceAddress) async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.connect,
        <String, dynamic>{'deviceAddress': deviceAddress},
      );
    } catch (e) {
      throw 'Unable to call connect method. Error: $e';
    }
  }

  @override
  Future<List<BluetoothDevice>> fetchPairedDevices() async {
    try {
      final data = await methodChannel.invokeListMethod(
        BluetoothClientMethods.fetchPairedDevices,
      );
      final List<BluetoothDevice> devices = (data ?? [])
          .map((e) => BluetoothDevice.fromMap((e as Map).cast()))
          .toList();
      return devices;
    } catch (e) {
      throw 'Unable to call fetchPairedDevices method. Error: $e';
    }
  }

  @override
  Future<void> startScan() async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.startScan,
      );
    } catch (e) {
      throw 'Unable to call startScan method. Error: $e';
    }
  }

  @override
  Future<void> stopScan() async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.stopScan,
      );
    } catch (e) {
      throw 'Unable to call stopScan method. Error: $e';
    }
  }

  @override
  Future<void> dispose() async {
    try {
      await methodChannel.invokeMethod<void>(
        BluetoothClientMethods.dispose,
      );
    } catch (e) {
      throw 'Unable to call dispose method. Error: $e';
    }
  }
}
