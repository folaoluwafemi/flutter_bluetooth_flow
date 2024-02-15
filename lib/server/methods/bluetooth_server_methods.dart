import 'package:flutter/services.dart';

abstract final class BluetoothServerMethods {
  static const String initialize = 'initialize';
  static const String updateServerUUID = 'updateServerUUID';
  static const String isBluetoothEnabled = 'isBluetoothEnabled';
  static const String startServer = 'startServer';
  static const String stopServer = 'stopServer';
  static const String send = 'send';
  static const String dispose = 'release';
}

enum BluetoothServerMethod<ReturnType, ParamType> {
  initialize<void, void>(
    BluetoothServerMethods.initialize,
    null,
  ),
  updateServerUUID<void, String>(
    BluetoothServerMethods.updateServerUUID,
    'uuidSeed',
  ),
  isBluetoothEnabled<bool, void>(
    BluetoothServerMethods.isBluetoothEnabled,
    null,
  ),
  startServer<void, void>(
    BluetoothServerMethods.startServer,
    null,
  ),
  stopServer<void, void>(
    BluetoothServerMethods.stopServer,
    null,
  ),
  send<void, Uint8List>(
    BluetoothServerMethods.send,
    'data',
  ),
  dispose<void, void>(
    BluetoothServerMethods.dispose,
    null,
  ),
  ;

  final String name;
  final String? paramKey;

  const BluetoothServerMethod(this.name, this.paramKey);

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
