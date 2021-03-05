import 'package:recase/recase.dart';

String usecaseTemplate(String usecaseName) {
  var output = '''
abstract class I${ReCase(usecaseName).pascalCase}Usecase {
  Future<void>call();
}


class ${ReCase(usecaseName).pascalCase}Usecase implements I${ReCase(usecaseName).pascalCase}Usecase {
  @override
  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
  ''';

  return output;
}
