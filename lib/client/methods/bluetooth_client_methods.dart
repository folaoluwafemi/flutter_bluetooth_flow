import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_flow/domain/model/bluetooth_device.dart';

abstract final class BluetoothClientMethods {
  static const String isBluetoothEnabled = 'isBluetoothEnabled';
  static const String send = 'send';
  static const String disconnect = 'disconnect';
  static const String connect = 'connect';
  static const String fetchPairedDevices = 'fetchPairedDevices';
  static const String startScan = 'startScan';
  static const String stopScan = 'stopScan';
  static const String dispose = 'release';
}

enum BluetoothClientMethod<ReturnType, ParamType> {
  isBluetoothEnabled<bool, void>(
    BluetoothClientMethods.isBluetoothEnabled,
    null,
  ),
  send<void, Uint8List>(BluetoothClientMethods.send, 'data'),
  disconnect<void, void>(BluetoothClientMethods.disconnect, null),
  connect<void, String>(
    BluetoothClientMethods.connect,
    'deviceAddress',
  ),
  fetchPairedDevices<List<dynamic>, void>(
    BluetoothClientMethods.fetchPairedDevices,
    null,
  ),
  startScan<void, void>(
    BluetoothClientMethods.startScan,
    null,
  ),
  stopScan<void, void>(
    BluetoothClientMethods.stopScan,
    null,
  ),
  dispose<void, void>(
    BluetoothClientMethods.dispose,
    null,
  ),
  ;

  final String name;
  final String? paramKey;

  const BluetoothClientMethod(this.name, this.paramKey);

  Future<ReturnType?> call(
    MethodChannel methodChannel, {
    required ParamType param,
  }) async {
    final ReturnType? type = await methodChannel.invokeMethod<ReturnType>(
      name,
      paramKey == null ? null : <String, dynamic>{paramKey!: param},
    );
    return type;
  }
}
