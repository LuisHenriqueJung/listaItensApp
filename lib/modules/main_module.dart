import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/models/user_model.dart';

import 'package:listagem/modules/crud/crud_module.dart';
import 'package:listagem/modules/login/login_module.dart';
import 'package:listagem/modules/login/pages/login_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => User())];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/crudmodule', module: CrudModule()),
      ];
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300], // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: const AppBarTheme(foregroundColor: Colors.white)),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
