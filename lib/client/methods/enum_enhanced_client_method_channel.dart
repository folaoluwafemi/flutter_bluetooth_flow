part of 'bluetooth_client_platform_interface.dart';

final class EnumEnhancedBluetoothClientMethodChannel
    extends BluetoothClientPlatformInterface {
  final methodChannel = const MethodChannel(
    'com.dartgod/bluetooth_client_methods',
  );

  @override
  Future<bool> isBluetoothEnabled() async {
    try {
      const method = BluetoothClientMethod.isBluetoothEnabled;
      final bool? value = await method.call(methodChannel, param: null);
      return value ?? false;
    } catch (e) {
      throw 'Unable to call isBluetoothEnabled method. Error: $e';
    }
  }

  @override
  Future<void> send(Uint8List data) async {
    try {
      const method = BluetoothClientMethod.send;
      await method.call(methodChannel, param: data);
    } catch (e) {
      throw 'Unable to call send method. Error: $e';
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      const method = BluetoothClientMethod.disconnect;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call disconnect method. Error: $e';
    }
  }

  @override
  Future<void> connect(String deviceAddress) async {
    try {
      const method = BluetoothClientMethod.connect;
      await method.call(methodChannel, param: deviceAddress);
    } catch (e) {
      throw 'Unable to call connect method. Error: $e';
    }
  }

  @override
  Future<List<BluetoothDevice>> fetchPairedDevices() async {
    try {
      const method = BluetoothClientMethod.fetchPairedDevices;
      final data = await method.call(methodChannel, param: null);
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
      const method = BluetoothClientMethod.startScan;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call startScan method. Error: $e';
    }
  }

  @override
  Future<void> stopScan() async {
    try {
      const method = BluetoothClientMethod.stopScan;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call stopScan method. Error: $e';
    }
  }

  @override
  Future<void> dispose() async {
    try {
      const method = BluetoothClientMethod.dispose;
      await method.call(methodChannel, param: null);
    } catch (e) {
      throw 'Unable to call dispose method. Error: $e';
    }
  }
}
