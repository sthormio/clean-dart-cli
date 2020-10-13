import '../../../shared/errors/upgrade_error.dart';
import '../../../shared/interfaces/iupgrade_cli.dart';
import '../../../shared/utils/output_utils.dart' as output;

class CommomCommandsController {
  final IUpgradeCLI _iUpgradeCLI;

  CommomCommandsController(this._iUpgradeCLI);

  void upgradeCli() async {
    try {
      var result = await _iUpgradeCLI();
      if (result) {
        output.title('clean-dart upgraded');
      }
    } on UpgradeError catch (e) {
      output.error(e.message);
    }
  }
}
