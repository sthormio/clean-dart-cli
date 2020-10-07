import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateDomain implements IGenerate {
  @override
  Future<void> call(String path) async {
    var dir = await Directory('$path/external').create();
    await Directory('${dir.path}/datasource').create();
  }
}