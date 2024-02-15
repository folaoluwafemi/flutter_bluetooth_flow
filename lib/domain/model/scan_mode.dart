enum ScanMode {
  none,
  connectable,
  discoverable,
  ;

  factory ScanMode.fromInt(int value) {
    return ScanMode.values[value];
  }
}
