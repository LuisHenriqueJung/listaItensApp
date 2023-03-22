import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/modules/main_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
