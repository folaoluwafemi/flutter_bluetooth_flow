part of 'bluetooth_server_platform_interface.dart';

final class BluetoothServerEventChannel extends BluetoothServerPlatformInterface {
  BluetoothServerEventChannel() : super();
  final EventChannel onDataReceivedChannel = const EventChannel(
    'com.dartgod/server_data_event_channel',
  );
  final EventChannel onConnectedChannel = const EventChannel(
    'com.dartgod/server_on_connected_event_channel',
  );

  @override
  Stream<bool> get onConnected {
    return onDataReceivedChannel.receiveBroadcastStream().map((event) {
      return event as bool;
    });
  }

  @override
  Stream<Uint8List> get onDataReceived {
    return onConnectedChannel.receiveBroadcastStream().map((event) {
      return event as Uint8List;
    });
  }
}
