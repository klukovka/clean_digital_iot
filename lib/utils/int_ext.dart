extension IntExt on int {
  String get timeFormatted => '$this'.padLeft(2, '0');
}
