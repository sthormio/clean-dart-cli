import 'package:process_run/shell.dart';

import '../../../shared/errors/upgrade_error.dart';
import '../../../shared/interfaces/iupgrade_cli.dart';

class UpgradeCLI implements IUpgradeCLI {
  @override
  Future<bool> call() async {
    var shell = Shell();

    try {
      await shell.run(
        'pub global activate clean_dart_cli',
      );
      return true;
    } catch (e) {
      throw UpgradeError();
    }
  }
}
