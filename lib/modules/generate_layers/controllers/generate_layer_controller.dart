import 'package:cli_dialog/cli_dialog.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

import '../../../shared/interfaces/igenerate_layers.dart';
import '../../../shared/utils/output_utils.dart' as output;

enum ClassLayer { Domain, Infra, External, UI, Complete }

class GenerateLayerController {
  final getIt = GetIt.instance;
  final IGenerateLayers _domain;
  final IGenerateLayers _infra;
  final IGenerateLayers _external;
  final IGenerateLayers _ui;
  final IGenerateLayers _complete;

  GenerateLayerController(
    this._domain,
    this._infra,
    this._external,
    this._ui,
    this._complete,
  );

  void _generateLayer({
    required String layer,
    required String path,
    required ClassLayer layerClass,
  }) async {
    output.warn('generating $layer layer....');
    var pathNomalized = p.normalize('${p.current}/$path');
    var result;
    switch (layerClass) {
      case ClassLayer.Domain:
        result = await _domain.call(pathNomalized);
        break;
      case ClassLayer.Infra:
        result = await _infra.call(pathNomalized);
        break;
      case ClassLayer.External:
        result = await _external.call(pathNomalized);
        break;
      case ClassLayer.UI:
        result = await _ui.call(pathNomalized);
        break;
      case ClassLayer.Complete:
        result = await _complete.call(pathNomalized);
        break;
      default:
    }
    if (result) {
      output.title('${layer.toUpperCase()} layer created');
      return;
    }
    output.error('Directory not exists');
  }

  Map<String, String> askQuestion() {
    const listQuestions = [
      [
        {
          'question': "What's layer that your want generate?",
          'options': ['domain', 'infra', 'external', 'ui', 'complete']
        },
        'layer'
      ]
    ];
    const questions = [
      ["What's your path?", 'path']
    ];

    final dialog = CLI_Dialog(
      questions: questions,
      listQuestions: listQuestions,
      order: ['layer', 'path'],
    );

    final anwers = dialog.ask();

    final result = <String, String>{
      'layer': anwers['layer'] as String,
      'path': anwers['path'] as String,
    };
    return result;
  }

  Future<void> generateLayerFolders({
    required String layerCommand,
    required String path,
  }) async {
    switch (layerCommand) {
      case 'domain':
        _generateLayer(
          layer: layerCommand,
          path: path,
          layerClass: ClassLayer.Domain,
        );
        break;
      case 'infra':
        _generateLayer(
          layer: layerCommand,
          path: path,
          layerClass: ClassLayer.Infra,
        );
        break;
      case 'external':
        _generateLayer(
          layer: layerCommand,
          path: path,
          layerClass: ClassLayer.External,
        );
        break;
      case 'ui':
        _generateLayer(
          layer: layerCommand,
          path: path,
          layerClass: ClassLayer.UI,
        );
        break;
      case 'complete':
        _generateLayer(
          layer: layerCommand,
          path: path,
          layerClass: ClassLayer.Complete,
        );
        break;
      default:
        output.error('This Layer not exists');
    }
  }
}
