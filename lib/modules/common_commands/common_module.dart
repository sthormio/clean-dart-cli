import 'package:clean_dart_cli/modules/common_commands/controllers/common_commands_controller.dart';
import 'package:clean_dart_cli/modules/common_commands/usecases/get_version.dart';
import 'package:clean_dart_cli/modules/common_commands/usecases/upgrade_cli.dart';
import 'package:clean_dart_cli/shared/interfaces/iget_version_cli.dart';
import 'package:clean_dart_cli/shared/interfaces/iupgrade_cli.dart';
import 'package:get_it/get_it.dart';

class CommonCommandsModule {
  final getIt = GetIt.instance;
  void _setup() {
    getIt.registerLazySingleton<IUpgradeCLI>(() => UpgradeCLI());
    getIt.registerLazySingleton<IGetVersionCli>(() => GetVersionCli());
    getIt.registerLazySingleton<CommomCommandsController>(
      () => CommomCommandsController(
        getIt.get<IUpgradeCLI>(),
        getIt.get<IGetVersionCli>(),
      ),
    );
  }

  CommonCommandsModule() {
    _setup();
  }
}
