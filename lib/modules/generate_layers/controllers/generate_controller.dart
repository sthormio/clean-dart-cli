import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_domain_controller.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';
import 'package:cli_dialog/cli_dialog.dart';

class GenerateController {
  final GenerateDomainController generateDomainController;
  final GenerateLayerController generateLayerController;

  GenerateController(
    this.generateDomainController,
    this.generateLayerController,
  );

  Map<dynamic, dynamic> anwers = {};

  Future<void> genereteQuestion() async {
    const listGenQuestion = [
      [
        {
          'question': 'What you want generate?',
          'options': ['Layer', 'Layer Content']
        },
        'gen'
      ],
    ];

    var dialog = CLI_Dialog(listQuestions: listGenQuestion);
    anwers = dialog.ask();
    print(anwers);

    if (anwers['gen'] == 'Layer') {
      const listLayerGenerate = [
        [
          {
            'question': 'What you want generate?',
            'options': ['Domain', 'Infra', 'External', 'UI', 'All']
          },
          'layer'
        ],
      ];
      const pathQuestion = [
        ['Where is your path?', 'path']
      ];
      dialog = CLI_Dialog(
        listQuestions: listLayerGenerate,
        questions: pathQuestion,
        order: ['layer', 'path'],
      );
      anwers = dialog.ask();

      await generateLayerController.generateLayerFolders(
        layerCommand: (anwers['layer'] as String).toLowerCase() == 'all'
            ? 'complete'
            : (anwers['layer'] as String).toLowerCase(),
        path: anwers['path'],
      );
    } else {}
  }
}
