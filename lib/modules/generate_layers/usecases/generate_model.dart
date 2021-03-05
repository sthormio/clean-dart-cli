import 'dart:io';

import 'package:clean_dart_cli/shared/errors/file_exists_error.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_model.dart';
import 'package:clean_dart_cli/shared/templates/model_template.dart';
import 'package:recase/recase.dart';

class GenerateModel implements IGenerateModel {
  @override
  Future<bool> call(String modelName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    var existFile =
        await File('${path}/${ReCase(modelName).snakeCase}_model.dart')
            .exists();

    if (existFile) {
      throw FileExistsError(innerException: Exception());
    }

    if (isValidDirectory) {
      File('${path}/${ReCase(modelName).snakeCase}_model.dart')
          .createSync(recursive: true);
      var content = modelTemplate(modelName);
      File('${path}/${ReCase(modelName).snakeCase}_model.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
