part of 'bluetooth_client_platform_interface.dart';

final class BluetoothClientEventChannel extends BluetoothClientEventInterface {
  BluetoothClientEventChannel() : super();

  final EventChannel _onDataReceivedChannel = const EventChannel(
    'com.dartgod/client_data_event_channel',
  );
  final EventChannel _onConnectedEventChannel = const EventChannel(
    'com.dartgod/client_on_connected_event_channel',
  );
  final EventChannel onScanDeviceEventChannel = const EventChannel(
    'com.dartgod/client_scan_device_event_channel',
  );

  final EventChannel _onScanModeEventChannel = const EventChannel(
    'com.dartgod/client_scan_mode_event_channel',
  );

  @override
  Stream<bool> get onConnected {
    return _onConnectedEventChannel.receiveBroadcastStream().map((event) {
      return event as bool;
    });
  }

  @override
  Stream<Uint8List> get onDataReceived {
    return _onDataReceivedChannel.receiveBroadcastStream().map((event) {
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
    return _onScanModeEventChannel.receiveBroadcastStream().map((event) {
      return ScanMode.values[event as int];
    });
  }
}
