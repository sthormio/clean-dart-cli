abstract class IUserUsecase {
  Future<void>call();
}


class UserUsecase implements IUserUsecase {
  @override
  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
  