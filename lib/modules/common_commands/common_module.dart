import 'package:args/args.dart';
import 'package:get_it/get_it.dart';

import '../../shared/interfaces/iget_version_cli.dart';
import '../../shared/interfaces/ihelp_command.dart';
import '../../shared/interfaces/iupgrade_cli.dart';
import 'usecases/ask_first_question.dart';
import 'controllers/common_commands_controller.dart';
import 'usecases/get_version.dart';
import 'usecases/help_command.dart';
import 'usecases/upgrade_cli.dart';

class CommonCommandsModule {
  final getIt = GetIt.instance;
  void _setup() {
    getIt.registerLazySingleton<IUpgradeCLI>(() => UpgradeCLI());
    getIt.registerLazySingleton<IGetVersionCli>(() => GetVersionCli());
    getIt.registerLazySingleton<IHelpCommand>(
      () => HelpCommand(
        getIt.get<ArgParser>(),
      ),
    );
    getIt.registerLazySingleton<CommomCommandsController>(
      () => CommomCommandsController(
        getIt.get<IUpgradeCLI>(),
        getIt.get<IGetVersionCli>(),
        getIt.get<IHelpCommand>(),
        AskFirstQuestion(),
      ),
    );
  }

  CommonCommandsModule() {
    _setup();
  }
}
