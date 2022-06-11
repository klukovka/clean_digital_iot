class StorageNullValueException implements Exception {
  final String message;

  StorageNullValueException(this.message);

  @override
  String toString() => message;
}
