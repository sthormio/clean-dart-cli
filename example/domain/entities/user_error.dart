class UserError implements Exception {
  final String _message;
  final Exception? innerException;

  UserError({required String message, this.innerException})
      : _message = message;

  String get message => _message;
}
