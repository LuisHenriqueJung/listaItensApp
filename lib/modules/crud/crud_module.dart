import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem/modules/crud/controllers/itens_controller.dart';
import 'package:listagem/modules/crud/pages/adicao_page.dart';
import 'package:listagem/modules/crud/pages/listagem_page.dart';

int menuSelected = 0;

class CrudModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => ItemController())];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => ListagemPage()),
        ChildRoute('/novoitem', child: (_, args) => const AdicaoPage()),
        ChildRoute('/editItem',
            child: (context, args) => AdicaoPage(item: args.data)),
      ];
}
