import 'package:clean_dart_cli/shared/interfaces/ihelp_command.dart';

import '../../../shared/errors/upgrade_error.dart';
import '../../../shared/interfaces/iask_first_question.dart';
import '../../../shared/interfaces/iget_version_cli.dart';
import '../../../shared/interfaces/iupgrade_cli.dart';
import '../../../shared/utils/output_utils.dart' as output;

class CommomCommandsController {
  final IUpgradeCLI _iUpgradeCLI;
  final IGetVersionCli _getVersionCli;
  final IHelpCommand _helpCommand;
  final IAskQuestion _askFistQuestion;

  CommomCommandsController(
    this._iUpgradeCLI,
    this._getVersionCli,
    this._helpCommand,
    this._askFistQuestion,
  );

  void upgradeCli() async {
    try {
      await _iUpgradeCLI();
    } on UpgradeError catch (e) {
      output.error(e.message);
    }
  }

  Future<void> getVersionCli() => _getVersionCli();

  void getHelpCommand() => _helpCommand();

  String askFirstQuestion() {
    final result = _askFistQuestion();
    return result['command'];
  }
}
