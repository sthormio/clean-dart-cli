import '../../../shared/constants.dart';
import '../../../shared/interfaces/iget_version_cli.dart';
import '../../../shared/utils/output_utils.dart' as output;

class GetVersionCli implements IGetVersionCli {
  @override
  Future<bool> call() async {
    output.title('Clean Dart CLI at $packageVersion');
    return true;
  }
}
