part of 'bluetooth_client_interface.dart';

final class BluetoothClient implements BluetoothClientInterface {
  final _methods = BluetoothClientMethodChannel();
  final _events = BluetoothClientEventChannel();

  @override
  Stream<Uint8List> get messageStream => _events.onDataReceived;

  @override
  Stream<bool> get onConnected => _events.onConnected;

  @override
  Stream<BluetoothDevice> get onDeviceDiscovered => _events.onScanDevice;

  @override
  Stream<ScanMode> get onScanModeChanged => _events.onScanModeChanged;

  @override
  Future<void> connect(String deviceAddress) async {
    await _methods.connect(deviceAddress);
  }

  @override
  Future<void> disconnect() async {
    await _methods.disconnect();
  }

  @override
  Future<void> dispose() async {
    await _methods.dispose();
  }

  @override
  Future<List<BluetoothDevice>> fetchPairedDevices() async {
    return await _methods.fetchPairedDevices();
  }

  @override
  Future<bool> isBluetoothEnabled() async {
    return await _methods.isBluetoothEnabled();
  }

  @override
  Future<void> send(Uint8List data) async {
    await _methods.send(data);
  }

  @override
  Future<void> startScan() async {
    await _methods.startScan();
  }

  @override
  Future<void> stopScan() async {
    await _methods.stopScan();
  }
}
