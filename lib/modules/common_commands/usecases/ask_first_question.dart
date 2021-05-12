import 'package:clean_dart_cli/shared/interfaces/iask_first_question.dart';
import 'package:cli_dialog/cli_dialog.dart';

class AskFirstQuestion implements IAskQuestion {
  @override
  Map<String, dynamic> call() {
    const listCummonQuestions = [
      [
        {
          'question': 'Which command would you like to use?',
          'options': [
            'gen',
            'upgrade',
            'help',
            'version',
          ]
        },
        'command'
      ],
    ];

    var dialog = CLI_Dialog(listQuestions: listCummonQuestions);
    final anwers = dialog.ask();
    final result = {
      'command': anwers['command'],
    };
    return result;
  }
}
