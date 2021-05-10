import 'package:cli_dialog/cli_dialog.dart';

import 'generate_domain_controller.dart';
import 'generate_layer_controller.dart';

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
    const pathQuestion = [
      ['Where is your path?', 'path']
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
    } else {
      const listDomainGenerateContent = [
        [
          {
            'question': 'What the domain content that you want generate?',
            'options': [
              'Usecase',
              'Entity',
              'Errors',
              'Model',
              'ModelJS',
            ]
          },
          'layerContent'
        ],
      ];

      const name = ['Define the name?', 'name'];

      dialog = CLI_Dialog(
        listQuestions: listDomainGenerateContent,
        questions: [
          name,
          pathQuestion.first,
        ],
        order: ['layerContent', 'name', 'path'],
      );
      anwers = dialog.ask();

      switch (anwers['layerContent']) {
        case 'Usecase':
          final result = await generateDomainController.generateUsecase(
            anwers['name'],
            anwers['path'],
          );

          if (!result) {
            await checkIfDirectoryExists(
              layer: 'domain',
              call: (String path) => generateDomainController.generateUsecase(
                anwers['name'],
                '$path/usecases',
              ),
            );
          }

          break;
        case 'Entity':
          final result = await generateDomainController.generateEntity(
            anwers['name'],
            anwers['path'],
          );

          if (!result) {
            await checkIfDirectoryExists(
              layer: 'domain',
              call: (String path) => generateDomainController.generateEntity(
                anwers['name'],
                '$path/entities',
              ),
            );
          }

          break;
        case 'Errors':
          final result = await generateDomainController.generateError(
            anwers['name'],
            anwers['path'],
          );

          if (!result) {
            await checkIfDirectoryExists(
              layer: 'domain',
              call: (String path) => generateDomainController.generateError(
                anwers['name'],
                '$path/errors',
              ),
            );
          }
          break;
        case 'Model':
          final result = await generateDomainController.generateModel(
            anwers['name'],
            anwers['path'],
          );

          if (!result) {
            await checkIfDirectoryExists(
              layer: 'infra',
              call: (String path) => generateDomainController.generateModel(
                anwers['name'],
                '$path/models',
              ),
            );
          }
          break;
        case 'ModelJS':
          final result = await generateDomainController.generateModelJs(
            anwers['name'],
            anwers['path'],
          );

          if (!result) {
            await checkIfDirectoryExists(
              layer: 'infra',
              call: (String path) => generateDomainController.generateModelJs(
                anwers['name'],
                '$path/models',
              ),
            );
          }
          break;
        default:
      }
    }
  }

  Future<void> checkIfDirectoryExists({
    required String layer,
    required Function(String path) call,
  }) async {
    final dialog = CLI_Dialog(
      booleanQuestions: [
        [
          'Do you would like create domain layer?',
          'create_directory',
        ],
      ],
    );

    final result = dialog.ask();

    if (!result['create_directory']) {
      return;
    }
    final path = (anwers['path'] as String).split('/');
    path.removeLast();
    await generateLayerController.generateLayerFolders(
      layerCommand: layer,
      path: path.first,
    );
    call(path.join('/'));
  }
}
