import 'package:clean_dart_cli/modules/app_module.dart';
import 'package:clean_dart_cli/modules/common_commands/controllers/common_commands_controller.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_controller.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:clean_dart_cli/shared/utils/validate_arguments.dart';
import 'package:clean_dart_cli/shared/utils/wellcome_message.dart';

late AppModule appModule;
late ValidateArguments validateArguments;

// List<String> arguments = ['upgrade'];

void main(List<String> arguments) {
  wellcomeMessage();
  appModule = AppModule();
  validateArguments = ValidateArguments(appModule: appModule);
  var generateController = appModule.generate.getIt<GenerateController>();
  var commomCommandsController =
      appModule.commandsModule.getIt<CommomCommandsController>();

  if (arguments.isNotEmpty) {
    var isValidArguments = validateArguments.validateArguments(arguments);
    if (isValidArguments != 'not valid arguments') {
      switch (isValidArguments) {
        case 'version':
          commomCommandsController.getVersionCli();
          break;
        case 'help':
          commomCommandsController.getHelpCommand();
          break;
        case 'layer':
          if (arguments.length > 2) {
            generateController.generateLayerController.generateLayerFolders(
              layerCommand: arguments[2],
              path: arguments.length == 4 ? arguments[3] : './',
            );
          } else {
            output.error('Invalid command, try with --help or -h');
          }

          break;
        case 'usecase':
          if (arguments.length > 3) {
            generateController.generateDomainController.generateUsecase(
              arguments[3],
              arguments[2],
            );
          } else {
            output.error('Missing arguments, especific your usecase name');
          }
          break;
        case 'entity':
          if (arguments.length > 3) {
            generateController.generateDomainController.generateEntity(
              arguments[3],
              arguments[2],
            );
          } else {
            output.error('Missing arguments, especific your entity name');
          }
          break;
        case 'model':
          if (arguments.length > 3) {
            generateController.generateDomainController.generateModel(
              arguments[3],
              arguments[2],
            );
          } else {
            output.error('Missing arguments, especific your model name');
          }
          break;
        case 'error':
          if (arguments.length > 3) {
            generateController.generateDomainController.generateError(
              arguments[3],
              arguments[2],
            );
          } else {
            output.error('Missing arguments, especific your error name');
          }
          break;
        case 'modelJs':
          if (arguments.length > 3) {
            generateController.generateDomainController.generateModelJs(
              arguments[3],
              arguments[2],
            );
          } else {
            output.error('Missing arguments, especific your modelJs name');
          }
          break;
        default:
      }

      switch (arguments[0]) {
        case 'upgrade':
          commomCommandsController.upgradeCli();
          break;
        default:
      }
    }
  } else {
    final result = commomCommandsController.askFirstQuestion();
    switch (result) {
      case 'gen':
        generateController.genereteQuestion();
        break;
      case 'upgrade':
        commomCommandsController.upgradeCli();
        break;
      case 'version':
        commomCommandsController.getVersionCli();
        break;
      case 'help':
        commomCommandsController.getHelpCommand();
        break;
      default:
    }
    // generateController.generateLayerController.generateLayerFolders();
  }

  return;
}
