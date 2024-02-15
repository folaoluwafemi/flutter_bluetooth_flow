part of 'bluetooth_client_platform_interface.dart';

final class BluetoothClientEventChannel
    extends BluetoothClientPlatformInterface {
  BluetoothClientEventChannel() : super();

  final EventChannel onDataReceivedChannel = const EventChannel(
    'com.dartgod/client_data_event_channel',
  );
  final EventChannel onConnectedEventChannel = const EventChannel(
    'com.dartgod/client_on_connected_event_channel',
  );
  final EventChannel onScanDeviceEventChannel = const EventChannel(
    'com.dartgod/client_scan_device_event_channel',
  );

  final EventChannel onScanModeEventChannel = const EventChannel(
    'com.dartgod/client_scan_mode_event_channel',
  );

  @override
  Stream<bool> get onConnected {
    return onConnectedEventChannel.receiveBroadcastStream().map((event) {
      return event as bool;
    });
  }

  @override
  Stream<Uint8List> get onDataReceived {
    return onDataReceivedChannel.receiveBroadcastStream().map((event) {
      return event as Uint8List;
    });
  }

  @override
  Stream<BluetoothDevice> get onScanDevice {
    return onScanDeviceEventChannel.receiveBroadcastStream().map((event) {
      return BluetoothDevice.fromMap((event as Map).cast());
    });
  }

  @override
  Stream<ScanMode> get onScanModeChanged {
    return onScanModeEventChannel.receiveBroadcastStream().map((event) {
      return ScanMode.values[event as int];
    });
  }
}
