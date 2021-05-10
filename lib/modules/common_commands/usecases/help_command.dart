import 'package:args/args.dart';
import 'package:clean_dart_cli/shared/interfaces/ihelp_command.dart';
import '../../../shared/utils/output_utils.dart' as output;

class HelpCommand implements IHelpCommand {
  final ArgParser argParser;

  HelpCommand(this.argParser);
  @override
  void call() {
    output.warn(
      '''
-------------------------- HELPS -------------------------- 
${argParser.usage}
''',
    );
  }
}
