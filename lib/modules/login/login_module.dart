import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/modules/login/controller/login_controller.dart';
import 'package:listagem/modules/login/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => LoginController())];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const LoginPage()),
      ];
}
