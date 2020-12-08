import 'dart:io';
import 'package:path/path.dart' as p;
import '../../../shared/interfaces/iget_version_cli.dart';
import '../../../shared/utils/output_utils.dart' as output;

class GetVersionCli implements IGetVersionCli {
  @override
  Future<bool> call() async {
    var pathNomalized = p.normalize('${p.current}/pubspec.yaml');
    var file = await File(pathNomalized);
    var content = await file.readAsLines();
    output.title('Clean Dart CLI at ${content[2]}');
    return true;
  }
}
