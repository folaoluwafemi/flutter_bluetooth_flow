part of 'bluetooth_server_interface.dart';

final class BluetoothServer implements BluetoothServerInterface {
  final BluetoothServerMethodsInterface _methods =
      BluetoothServerMethodChannel();
  final BluetoothServerEventInterface _events = BluetoothServerEventChannel();

  @override
  Stream<Uint8List> get messageStream => _events.onDataReceived;

  @override
  Stream<bool> get onConnected => _events.onConnected;

  @override
  Future<void> dispose() async {
    return _methods.dispose();
  }

  @override
  Future<void> initialize() async {
    await _methods.initialize();
  }

  @override
  Future<bool> isBluetoothEnabled() async {
    return await _methods.isBluetoothEnabled();
  }

  @override
  Future<void> sendToClient(Uint8List message) async {
    await _methods.send(message);
  }

  @override
  Future<void> startServer() async {
    await _methods.startServer();
  }

  @override
  Future<void> stopServer() async {
    await _methods.stopServer();
  }

  @override
  Future<void> updateServerUUID(String uuidSeed) async {
    await _methods.updateServerUUID(uuidSeed);
  }
}
