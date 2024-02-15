final class BluetoothDevice {
  final String name;
  final String address;
  final bool isPaired;
  final bool isConnected;

  const BluetoothDevice({
    required this.name,
    required this.address,
    required this.isPaired,
    required this.isConnected,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'isPaired': isPaired,
      'isConnected': isConnected,
    };
  }

  factory BluetoothDevice.fromMap(Map<String, dynamic> map) {
    return BluetoothDevice(
      name: map['name'] as String,
      address: map['address'] as String,
      isPaired: map['isPaired'] as bool,
      isConnected: map['isConnected'] as bool,
    );
  }
}
