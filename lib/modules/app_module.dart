import 'package:args/args.dart';
import 'package:clean_dart_cli/modules/common_commands/common_module.dart';

import 'generate_layers/generate_module.dart';

class AppModule {
  GenerateModule generate;
  CommonCommandsModule commandsModule;
  ArgResults argResults;
  ArgParser argParser;

  void _addOptionsArguments(ArgParser argParser) {
    argParser.addOption(
      'gen',
      abbr: 'g',
      allowed: [
        'layer',
        'usecase',
        'datasource',
        'entity',
        'model',
        'modelJs',
        'error'
      ],
      help: 'command to generate something',
    );

    argParser.addOption(
      'upgrade',
      abbr: 'u',
      help: 'command to upgrade your clean-dart-cli',
    );

    argParser.addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'command to show all commands ables',
    );

    argParser.addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'command to show the current version of the clean-dart-cli',
    );
  }

  void _bootstrap() {
    argParser = ArgParser();
    _addOptionsArguments(argParser);
    generate = GenerateModule();
    commandsModule = CommonCommandsModule();
  }

  AppModule() {
    _bootstrap();
  }
}
