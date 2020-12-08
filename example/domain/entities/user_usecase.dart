abstract class IUser {
  Future<void>call();
}


class User implements IUser {
  @override
  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
  