import 'dart:typed_data';

abstract class BluetoothInterface {
  Stream<bool> get onConnectedStream;

  Stream<Uint8List> get messageStream;

  Future<bool> isBluetoothEnabled();

  Future<void> sendMessage(Uint8List data);

  Future<void> dispose();
}
