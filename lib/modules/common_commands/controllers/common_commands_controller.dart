import 'package:clean_dart_cli/shared/interfaces/iget_version_cli.dart';

import '../../../shared/errors/upgrade_error.dart';
import '../../../shared/interfaces/iupgrade_cli.dart';
import '../../../shared/utils/output_utils.dart' as output;

class CommomCommandsController {
  final IUpgradeCLI _iUpgradeCLI;
  final IGetVersionCli _getVersionCli;

  CommomCommandsController(this._iUpgradeCLI, this._getVersionCli);

  void upgradeCli() async {
    try {
      await _iUpgradeCLI();
    } on UpgradeError catch (e) {
      output.error(e.message);
    }
  }

  Future<void> getVersionCli() async {
    await _getVersionCli();
  }
}
