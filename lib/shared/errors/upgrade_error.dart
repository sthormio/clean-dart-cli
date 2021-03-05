class UpgradeError implements Exception {
  final String _message;
  final Exception? innerException;

  UpgradeError({
    this.innerException,
    String message = 'Error to upgrade the clean-dart-cli, try again',
  }) : _message = message;

  String get message => _message;
}
